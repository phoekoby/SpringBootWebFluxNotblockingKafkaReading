package ru.evrazhackaton.service.config;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.reactive.ReactiveKafkaConsumerTemplate;
import reactor.core.Disposable;
import reactor.core.publisher.Flux;
import reactor.core.scheduler.Schedulers;
import reactor.kafka.receiver.ReceiverOptions;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.repository.ExgausterMomentRepository;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.service.ExgausterService;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

@Configuration
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class KafkaConfig {
    ExgausterService exgausterService;


    @Bean
    public ReceiverOptions<String, Map<String, Object>> kafkaReceiverOptions(@Value(value = "${FAKE_CONSUMER_DTO_TOPIC}") String topic, KafkaProperties kafkaProperties) {
        ReceiverOptions<String, Map<String, Object>> basicReceiverOptions = ReceiverOptions.create(kafkaProperties.buildConsumerProperties());
        return basicReceiverOptions.subscription(Collections.singletonList(topic));
    }

    @Bean
    public ReactiveKafkaConsumerTemplate<String, Map<String, Object>> reactiveKafkaConsumerTemplate(ReceiverOptions<String, Map<String, Object>> kafkaReceiverOptions) {
        return new ReactiveKafkaConsumerTemplate<>(kafkaReceiverOptions);
    }


    @Bean
    public Flux<ExgausterMomentDto> kafkaFlux(ReactiveKafkaConsumerTemplate<String, Map<String, Object>> reactiveKafkaConsumerTemplate){
        return reactiveKafkaConsumerTemplate
                .receiveAutoAck()
                .map(ConsumerRecord::value)
                .publishOn(Schedulers.boundedElastic())
                .flatMap(mapa -> {
                    String timestampString = (String) mapa.remove("moment");
                    try {
                        Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.sssss",
                                Locale.US).parse(timestampString + "Z");
                        Timestamp timestamp = new Timestamp(date.getTime());
                        return Flux.fromIterable(mapa.entrySet().stream()
                                .map(entry -> ExgausterMomentDto.builder()
                                        .moment(timestamp)
                                        .key(entry.getKey())
                                        .value((Double) entry.getValue())
                                        .build())
                                .collect(Collectors.toList()));
                    } catch (ParseException e) {
                        return Flux.error(new RuntimeException(e));
                    }
                });
    }


    @Bean
    public Disposable exgausterMomentDtoFlux(Flux<ExgausterMomentDto> kafkaFlux){
        return kafkaFlux.share()
                .flatMap(exgausterService::save)
                .checkpoint("Saved to DB")
                .subscribe();
    }
}
