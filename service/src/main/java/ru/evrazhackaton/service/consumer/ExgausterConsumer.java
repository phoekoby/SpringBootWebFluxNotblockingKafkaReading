package ru.evrazhackaton.service.consumer;

import jakarta.annotation.PostConstruct;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.context.event.EventListener;
import org.springframework.kafka.core.reactive.ReactiveKafkaConsumerTemplate;
import org.springframework.stereotype.Component;
import reactor.core.Disposable;
import reactor.core.publisher.Flux;
import reactor.core.scheduler.Schedulers;
import ru.evrazhackaton.service.ServiceApplication;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.service.ExgausterService;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterConsumer {
    ReactiveKafkaConsumerTemplate<String, Map<String, Object>> reactiveKafkaConsumerTemplate;
    ExgausterService exgausterService;

    @PostConstruct
    public Disposable listen(){
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
                                .map(entry -> InputExgausterMomentDto.builder()
                                        .moment(timestamp)
                                        .key(entry.getKey())
                                        .value((Double) entry.getValue())
                                        .build())
                                .collect(Collectors.toList()));
                    } catch (ParseException e) {
                        return Flux.error(new RuntimeException(e));
                    }
                })
                .flatMap(exgausterService::save)
                .subscribe();
    }
}
