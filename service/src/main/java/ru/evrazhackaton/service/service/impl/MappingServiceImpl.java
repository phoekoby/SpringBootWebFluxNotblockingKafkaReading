package ru.evrazhackaton.service.service.impl;

import com.hazelcast.map.IMap;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.service.MappingService;

import java.util.Objects;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class MappingServiceImpl implements MappingService {
    MappingRepository mappingRepository;
    IMap<Long, MappingEntity> mappingCacheById;
    IMap<String, MappingEntity> mappingCacheByPlace;

    @Override
    public Mono<MappingEntity> getById(Long id) {
       // return mappingRepository.findById(id);
        return Mono.fromCompletionStage(mappingCacheById.getAsync(id)
                .thenApply(mappingEntity -> Objects.requireNonNullElseGet(mappingEntity, MappingEntity::new)))
                 .flatMap(mappingEntity -> {
                     if(mappingEntity.getId() == null){
                         return Mono.zip(mappingRepository.findById(id), Mono.just(true));
                     }
                     return Mono.zip(Mono.just(mappingEntity), Mono.just(false));
                 }).flatMap(tuple -> {
                     boolean needToAddToCache = tuple.getT2();
                     if(needToAddToCache){
                         return Mono.fromCompletionStage(mappingCacheById.putAsync(id, tuple.getT1()));
                     }
                     return Mono.just(tuple.getT1());
                 });
    }
    @Override
    public Mono<MappingEntity> getByPlace(String place) {
      //  return mappingRepository.getByPlace(place);
        return Mono.fromCompletionStage(mappingCacheByPlace.getAsync(place)
                        .thenApply(mappingEntity -> Objects.requireNonNullElseGet(mappingEntity, MappingEntity::new)))
                .flatMap(mappingEntity -> {
                    if(mappingEntity.getId() == null){
                        return Mono.zip(mappingRepository.getByPlace(place), Mono.just(true));
                    }
                    return Mono.zip(Mono.just(mappingEntity), Mono.just(false));
                }).flatMap(tuple -> {
                    boolean needToAddToCache = tuple.getT2();
                    if(needToAddToCache){
                        return Mono.fromCompletionStage(mappingCacheByPlace.putAsync(place, tuple.getT1()));
                    }
                    return Mono.just(tuple.getT1());
                });
    }

}
