package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.StatisticValue;

@Repository
public interface StatisticValueRepository extends R2dbcRepository<StatisticValue, Long> {
    Mono<StatisticValue> getByMappingId(Long mappingId);
}
