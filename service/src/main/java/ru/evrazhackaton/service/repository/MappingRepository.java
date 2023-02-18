package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import ru.evrazhackaton.service.entity.MappingEntity;

@Repository
public interface MappingRepository extends R2dbcRepository<Long, MappingEntity> {
}
