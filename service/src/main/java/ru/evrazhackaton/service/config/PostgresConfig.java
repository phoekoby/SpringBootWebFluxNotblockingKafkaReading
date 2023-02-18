package ru.evrazhackaton.service.config;

import io.r2dbc.postgresql.PostgresqlConnectionConfiguration;
import io.r2dbc.postgresql.PostgresqlConnectionFactory;
import io.r2dbc.spi.ConnectionFactory;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.r2dbc.config.AbstractR2dbcConfiguration;


@Configuration
public class PostgresConfig extends AbstractR2dbcConfiguration {

    @Value("${database.name:postgres}")
    private String database;

    @Value("${database.host:localhost}")
    private String host;

    @Value("${database.port:5431}")
    private int port;

    @Value("${database.username:postgres}")
    private String username;

    @Value("${database.password:postgres}")
    private String password;

    @Bean
    @NonNull
    public ConnectionFactory connectionFactory() {
        return new PostgresqlConnectionFactory(PostgresqlConnectionConfiguration.builder()
                .host(host)
                .port(port)
                .username(username)
                .password(password)
                .database(database)
                .build());
    }
}
