package ru.evrazhackaton.service.repository;

import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.entity.ExgausterMoment;

import java.util.List;

@Repository
public interface ExgausterMomentRepository extends R2dbcRepository<Long, ExgausterMoment> {

    @Query("select * from ")
    Flux<ExgausterMoment> findAllByKeys(List<String> keys);
}
