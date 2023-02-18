package ru.evrazhackaton.service.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.r2dbc.postgresql.PostgresqlConnectionConfiguration;
import io.r2dbc.postgresql.PostgresqlConnectionFactory;
import io.r2dbc.postgresql.api.PostgresqlConnection;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.pojo.HazelSet;
import ru.evrazhackaton.service.service.NotificationService;

@Slf4j
@RequiredArgsConstructor
@Service
public class NotificationServiceImpl implements NotificationService {
    private final HazelSet<NotificationTopic> watchedTopics;
    private PostgresqlConnection connection;
    private final ObjectMapper objectMapper;

    /**
     * Listen to a postgreSQL topic
     *
     * @param topic Topic to which the connection needs to subscribe
     * @param clazz class of the notification parameter (used for deserialization)
     * @return the notification parameters
     */
    public <T> Flux<T> listen(final NotificationTopic topic, final Class<T> clazz) {
        return Mono.fromCompletionStage(watchedTopics.addAsync(topic).thenApply(nt -> nt == null ? NotificationTopic.NONE : nt))
                .flatMap(nt -> {
                    if(nt == NotificationTopic.NONE){
                        return executeListenStatement(topic)
                                .then(Mono.just(topic));
                    }
                    return Mono.just(topic);
                })
                .flatMapMany(nt -> connection.getNotifications()
                    .filter(notification -> topic.name().equals(notification.getName()) && notification.getParameter() != null)
                    .flatMap(notification -> {
                        final String json = notification.getParameter();
                        try {
                            return Mono.just(objectMapper.readValue(json, clazz));
                        } catch (JsonProcessingException e) {
                            return Flux.error(new RuntimeException(e));
                        }
                    }));
    }


    public Mono<Void> unlisten(final NotificationTopic topic) {
        return Mono.fromCompletionStage(watchedTopics.addAsync(topic).thenApply(nt -> nt == null ? NotificationTopic.NONE : nt))
                .filter(nt -> nt.equals(NotificationTopic.NONE))
                .flatMap(this::executeListenStatement);
    }

    @PreDestroy
    private void preDestroy() {
        this.connection.close().subscribe();
    }

    @PostConstruct
    private void postConstruct(){
         connection = new PostgresqlConnectionFactory(PostgresqlConnectionConfiguration.builder()
                .host("localhost")
                .port(5431)
                .username("postgres")
                .password("postgres")
                .database("postgres")
                .build()).create()
                 .block();
    }

    /**
     * Execute the SQL statement used to listen to a given topic
     *
     * @param topic Name of the topic to listen to
     */
    private Mono<Void> executeListenStatement(final NotificationTopic topic) {

        // Topic in upper-case must be surrounded by quotes
       return connection.createStatement(String.format("LISTEN \"%s\"", topic))
               .execute()
               .then();
    }

    /**
     * Execute the SQL statement used to unlisten from a given topic
     *
     * @param topic Name of the topic to unlisten from
     */
    private Mono<Void> executeUnlistenStatement(final NotificationTopic topic) {

        // Topic in upper-case must be surrounded by quotes
       return connection.createStatement(String.format("UNLISTEN \"%s\"", topic))
                .execute()
                .then();
    }
}
