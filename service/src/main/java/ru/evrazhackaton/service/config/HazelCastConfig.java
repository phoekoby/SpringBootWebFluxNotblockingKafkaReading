package ru.evrazhackaton.service.config;


import com.hazelcast.config.Config;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.entity.StatisticValue;
import ru.evrazhackaton.service.pojo.HazelSet;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Configuration
public class HazelCastConfig {

    @Bean
    public HazelcastInstance hazelcastInstanceBean() {
        return Hazelcast.newHazelcastInstance(new Config().setClassLoader(this.getClass().getClassLoader()).setInstanceName(UUID.randomUUID().toString()));
    }

    @Bean
    public HazelSet<NotificationTopic> watchedTopicsSet(HazelcastInstance hazelcastInstanceBean){
        IMap<NotificationTopic, NotificationTopic> watchedTopics = hazelcastInstanceBean.getMap("watchedTopicsMap");
        return new HazelSet<>(watchedTopics, 1, TimeUnit.MINUTES);
    }

    @Bean
    public IMap<Long, MappingEntity> mappingCacheById(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("mappingCacheById");
    }

    @Bean
    public IMap<String, MappingEntity> mappingCacheByPlace(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("mappingCacheByPlace");
    }

    @Bean
    public IMap<Long, StatisticValue> statisticValueCacheById(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("statisticValueCacheById");
    }

    @Bean
    public IMap<Long, StatisticValue> statisticValueCacheByMappingId(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("statisticValueCacheByMappingId");
    }
}
