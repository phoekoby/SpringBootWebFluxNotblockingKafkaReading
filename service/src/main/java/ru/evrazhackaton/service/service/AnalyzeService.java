package ru.evrazhackaton.service.service;

import reactor.core.Disposable;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputWarningDto;

public interface AnalyzeService {
    //its doesn't have active methods now
    Disposable analyse();
}
