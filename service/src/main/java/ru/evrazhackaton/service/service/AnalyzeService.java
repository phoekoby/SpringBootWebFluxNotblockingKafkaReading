package ru.evrazhackaton.service.service;

import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputWarningDto;

public interface AnalyzeService {
    Flux<OutputWarningDto> getWarnings();
    Flux<OutputWarningDto> getWarnings(Integer exgauster);
}
