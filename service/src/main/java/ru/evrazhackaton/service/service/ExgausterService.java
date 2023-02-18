package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;

public interface ExgausterService {
    Flux<ExgausterMomentDto> saveAll(Flux<ExgausterMomentDto> exgausterMomentDtoFlux);
    Flux<ExgausterMomentDto> getByExgausterNumber(Integer number);
    Flux<ExgausterMomentDto> listenToSaved(Integer number);
    Mono<ExgausterMomentDto> save(ExgausterMomentDto dto);
}
