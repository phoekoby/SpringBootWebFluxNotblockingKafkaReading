package ru.evrazhackaton.service.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.entity.ExgausterMoment;

@Repository
public interface ExgausterMomentRepository extends R2dbcRepository<ExgausterMoment, Long> {
    @Query("select em.* from exgauster_moment em " +
            "join mapping m on em.mapping_id = m.id " +
            "where m.exgauster = :exgauster")
    Flux<ExgausterMoment> getAllByExgauster(Integer exgauster, Sort sort);
}
