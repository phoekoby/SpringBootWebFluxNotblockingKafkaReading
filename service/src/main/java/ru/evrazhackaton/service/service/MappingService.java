package ru.evrazhackaton.service.service;

import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.entity.MappingEntity;

import java.util.List;

public interface MappingService {
    Mono<MappingEntity> getById(Long id);
    Mono<MappingEntity> getByPlace(String place);

}
