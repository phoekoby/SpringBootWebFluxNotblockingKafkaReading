package ru.evrazhackaton.service.config;


import com.hazelcast.client.HazelcastClient;
import com.hazelcast.client.config.ClientConfig;
import com.hazelcast.client.config.XmlClientConfigBuilder;
import com.hazelcast.client.config.YamlClientConfigBuilder;
import com.hazelcast.config.Config;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.pojo.HazelSet;

import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Configuration
public class HazelCastConfig {

    @Bean
    public HazelcastInstance hazelcastInstanceBean() {
        return Hazelcast.newHazelcastInstance(new Config().setInstanceName(UUID.randomUUID().toString()));
    }

    @Bean
    public HazelSet<NotificationTopic> watchedTopicsSet(HazelcastInstance hazelcastInstanceBean){
        IMap<NotificationTopic, NotificationTopic> watchedTopics = hazelcastInstanceBean.getMap("watchedTopicsMap");
        return new HazelSet<>(watchedTopics, 1, TimeUnit.MINUTES);
    }
}
