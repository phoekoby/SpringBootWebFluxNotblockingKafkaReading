package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.dto.OutputExgausterMomentDto;

public interface ExgausterService {
    Flux<OutputExgausterMomentDto> saveAll(Flux<InputExgausterMomentDto> exgausterMomentDtoFlux);
    Flux<OutputExgausterMomentDto> getByExgausterNumber(Integer number);
    Flux<OutputExgausterMomentDto> getAll();
    Mono<OutputExgausterMomentDto> save(InputExgausterMomentDto dto);
    Mono<OutputExgausterMomentDto> convert(InputExgausterMomentDto dto);
}
