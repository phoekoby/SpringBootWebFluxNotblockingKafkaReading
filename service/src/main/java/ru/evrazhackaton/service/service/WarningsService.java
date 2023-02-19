package ru.evrazhackaton.service.service;


import org.springframework.data.domain.Pageable;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputWarningDto;

public interface WarningsService {
    Flux<OutputWarningDto> getAllByExgausterNumber(Integer exgauster, Integer limit, Integer offset, String sortedField);
    Flux<OutputWarningDto> getAll(Pageable pageable);
    Flux<OutputWarningDto> getRealTime();
    Flux<OutputWarningDto> getRealTimeByExgauster(Integer number);
}
