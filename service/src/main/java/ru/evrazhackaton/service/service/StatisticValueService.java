package ru.evrazhackaton.service.service;

import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.StatisticValue;

public interface StatisticValueService {
    Mono<StatisticValue> getByMappingId(Long mappingId);
    Mono<StatisticValue> save(StatisticValue statisticValue);
    Mono<Boolean> isExistsByMappingId(Long mappingId);
}
