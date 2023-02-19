package ru.evrazhackaton.service.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.entity.ExgausterMomentEntity;

@Repository
public interface ExgausterMomentRepository extends R2dbcRepository<ExgausterMomentEntity, Long> {
    @Query("select em.* from exgauster_moment em " +
            "join mapping m on em.mapping_id = m.id " +
            "where m.exgauster = :exgauster " +
            "order by :sortField " +
            "limit :limit " +
            "offset :offset")
    Flux<ExgausterMomentEntity> getAllByExgauster(Integer exgauster, Integer limit, Integer offset, String sortField);

    Flux<ExgausterMomentEntity> findAllBy(Pageable pageable);
}
