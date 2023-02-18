package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.NotificationTopic;

public interface NotificationService {
    <T> Flux<T> listen(final NotificationTopic notificationTopic, final Class<T> clazz);
    Mono<Void> unlisten(final NotificationTopic topic);
}
