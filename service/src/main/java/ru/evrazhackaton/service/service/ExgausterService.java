package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;

public interface ExgausterService {
    Flux<ExgausterMomentDto> saveAll(Flux<ExgausterMomentDto> exgausterMomentDtoFlux);
    Flux<ExgausterMomentDto> getByExgausterNumber(Integer number);
}
