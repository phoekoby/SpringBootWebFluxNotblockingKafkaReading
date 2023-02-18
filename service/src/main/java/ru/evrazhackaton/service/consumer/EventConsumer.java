package ru.evrazhackaton.service.consumer;

import jakarta.annotation.PostConstruct;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.core.reactive.ReactiveKafkaConsumerTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
@Slf4j
public class EventConsumer {
    ReactiveKafkaConsumerTemplate<String, String> reactiveKafkaConsumerTemplate;


    @PostConstruct
    public void onEvent(){
        reactiveKafkaConsumerTemplate
                .receiveAutoAck()
                .delayElements(Duration.ofSeconds(2L)) // BACKPRESSURE
                .subscribe();
    }
}
