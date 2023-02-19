package ru.evrazhackaton.service.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.r2dbc.repository.Query;
import org.springframework.data.r2dbc.repository.R2dbcRepository;
import org.springframework.stereotype.Repository;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.entity.WarningEntity;

@Repository
public interface WarningRepository extends R2dbcRepository<WarningEntity, Long> {

    @Query("select w.* from warning w " +
            "join mapping m on m.id = w.mapping_id " +
            "where m.exgauster = :exgauster")
    Flux<WarningEntity> getAllByExgauster(Integer exgauster, Pageable pageable);

    Flux<WarningEntity> findAllBy(Pageable pageable);
}
