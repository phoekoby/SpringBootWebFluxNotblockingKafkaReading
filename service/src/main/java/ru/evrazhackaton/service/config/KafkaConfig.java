package ru.evrazhackaton.service.config;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.core.reactive.ReactiveKafkaConsumerTemplate;
import reactor.core.publisher.Flux;
import reactor.core.scheduler.Schedulers;
import reactor.kafka.receiver.ReceiverOptions;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.service.ExgausterService;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.Map;
import java.util.stream.Collectors;

@Configuration
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class KafkaConfig {
    ExgausterService exgausterService;

    @Bean
    public ReceiverOptions<String, Map<String, String>> kafkaReceiverOptions(@Value(value = "${FAKE_CONSUMER_DTO_TOPIC}") String topic, KafkaProperties kafkaProperties) {
        ReceiverOptions<String, Map<String, String>> basicReceiverOptions = ReceiverOptions.create(kafkaProperties.buildConsumerProperties());
        return basicReceiverOptions.subscription(Collections.singletonList(topic));
    }

    @Bean
    public ReactiveKafkaConsumerTemplate<String, Map<String, String>> reactiveKafkaConsumerTemplate(ReceiverOptions<String, Map<String, String>> kafkaReceiverOptions) {
        return new ReactiveKafkaConsumerTemplate<>(kafkaReceiverOptions);
    }

    @Bean
    public Flux<ExgausterMomentDto> exgausterMomentDtoFlux(ReactiveKafkaConsumerTemplate<String, Map<String, String>> reactiveKafkaConsumerTemplate){
        return exgausterService.saveAll(reactiveKafkaConsumerTemplate.receiveAutoAck()
                .map(ConsumerRecord::value)
                .publishOn(Schedulers.boundedElastic())
                .flatMap(mapa -> {
                    String timestampString = mapa.remove("moment");
                    Timestamp timestamp = Timestamp.valueOf(timestampString);
                    return Flux.fromIterable(mapa.entrySet().stream()
                            .map(entry -> ExgausterMomentDto.builder()
                                    .moment(timestamp)
                                    .key(entry.getKey())
                                    .value(Double.valueOf(entry.getValue()))
                                    .build())
                            .collect(Collectors.toList()));
                }));
    }
}
