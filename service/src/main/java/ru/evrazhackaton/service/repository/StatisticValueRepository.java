package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.StatisticValueEntity;

@Repository
public interface StatisticValueRepository extends R2dbcRepository<StatisticValueEntity, Long> {
    Mono<StatisticValueEntity> getByMappingId(Long mappingId);
}
