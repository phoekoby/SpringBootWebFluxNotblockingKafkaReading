package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.MappingEntity;

public interface MappingService {
    Mono<MappingEntity> getById(Long id);
    Mono<MappingEntity> getByPlace(String place);
    Flux<MappingEntity> getAll();
}
