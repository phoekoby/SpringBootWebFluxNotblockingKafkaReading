package ru.evrazhackaton.service.service;

import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.StatisticValueEntity;

public interface StatisticValueService {
    Mono<StatisticValueEntity> getByMappingId(Long mappingId);
    Mono<StatisticValueEntity> save(StatisticValueEntity statisticValueEntity);
    Mono<Boolean> isExistsByMappingId(Long mappingId);
}
