package ru.evrazhackaton.service.service;

import org.springframework.data.domain.Pageable;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.dto.OutputExgausterMomentDto;

public interface ExgausterService {
    Flux<OutputExgausterMomentDto> saveAll(Flux<InputExgausterMomentDto> exgausterMomentDtoFlux);
    Flux<OutputExgausterMomentDto> getByExgausterNumber(Integer number, Pageable pageable);
    Flux<OutputExgausterMomentDto> getAll(Pageable pageable);
    Mono<OutputExgausterMomentDto> save(InputExgausterMomentDto dto);
    Flux<OutputExgausterMomentDto> getRealTimeByExgausterNumber(Integer exgausterNumber);
    Flux<OutputExgausterMomentDto> getRealTimeOutput();
    Flux<InputExgausterMomentDto> getRealTimeInput();
    Mono<OutputExgausterMomentDto> convert(InputExgausterMomentDto dto);
}
