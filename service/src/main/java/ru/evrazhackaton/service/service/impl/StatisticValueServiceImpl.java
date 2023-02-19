package ru.evrazhackaton.service.service.impl;

import com.hazelcast.map.IMap;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.StatisticValueEntity;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.repository.StatisticValueRepository;
import ru.evrazhackaton.service.service.StatisticValueService;

import java.util.concurrent.TimeUnit;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class StatisticValueServiceImpl implements StatisticValueService {
    IMap<Long, StatisticValueEntity> statisticValueCacheById;
    IMap<Long, StatisticValueEntity> statisticValueCacheByMappingId;
    MappingRepository mappingRepository;
    StatisticValueRepository statisticValueRepository;


    @Override
    public Mono<StatisticValueEntity> getByMappingId(Long mappingId) {
        return Mono.fromCompletionStage(statisticValueCacheByMappingId.getAsync(mappingId)
                .thenApply(statisticValueEntity -> {
                    if(statisticValueEntity == null)
                        return new StatisticValueEntity();
                    return statisticValueEntity;
                }))
                .flatMap(statisticValueEntity -> {
                    if(statisticValueEntity.getId() == null){
                        return Mono.zip(statisticValueRepository.getByMappingId(mappingId), Mono.just(true));
                    }
                    return Mono.zip(Mono.just(statisticValueEntity), Mono.just(false));
                })
                .flatMap(tuple -> {
                    boolean needToCache = tuple.getT2();
                    if(needToCache){
                        return Mono.fromCompletionStage(statisticValueCacheByMappingId.putAsync(mappingId, tuple.getT1()));
                    }
                    return Mono.just(tuple.getT1());
                });
    }

    @Override
    public Mono<StatisticValueEntity> save(StatisticValueEntity statisticValueEntity) {
        return statisticValueRepository.save(statisticValueEntity)
                .flatMap(savedValue -> Mono.fromCompletionStage(statisticValueCacheByMappingId.putAsync(statisticValueEntity.getId(), statisticValueEntity, 2, TimeUnit.HOURS)));
    }

    @Override
    public Mono<Boolean> isExistsByMappingId(Long mappingId) {
        return getByMappingId(mappingId)
                .hasElement();
    }
}
