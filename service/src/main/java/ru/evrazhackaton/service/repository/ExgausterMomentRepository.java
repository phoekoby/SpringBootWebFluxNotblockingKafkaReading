package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import ru.evrazhackaton.service.entity.ExgausterMoment;

@Repository
public interface ExgausterMomentRepository extends R2dbcRepository<Long, ExgausterMoment> {
}
