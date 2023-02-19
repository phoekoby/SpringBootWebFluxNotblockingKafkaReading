package ru.evrazhackaton.service.config;


import com.hazelcast.config.Config;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.entity.StatisticValueEntity;

import java.util.UUID;

@Configuration
public class HazelCastConfig {

    @Bean
    public HazelcastInstance hazelcastInstanceBean() {
        return Hazelcast.newHazelcastInstance(new Config().setClassLoader(this.getClass().getClassLoader()).setInstanceName(UUID.randomUUID().toString()));
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
    public IMap<Long, StatisticValueEntity> statisticValueCacheById(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("statisticValueCacheById");
    }

    @Bean
    public IMap<Long, StatisticValueEntity> statisticValueCacheByMappingId(HazelcastInstance hazelcastInstanceBean){
        return hazelcastInstanceBean.getMap("statisticValueCacheByMappingId");
    }
}
