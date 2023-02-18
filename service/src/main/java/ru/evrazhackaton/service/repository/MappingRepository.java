package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.MappingEntity;

@Repository
public interface MappingRepository extends R2dbcRepository<MappingEntity, Long> {
    Mono<MappingEntity> getByPlace(String place);
}
