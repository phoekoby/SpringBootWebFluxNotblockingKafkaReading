package ru.evrazhackaton.service.service.impl;

import jakarta.annotation.PostConstruct;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.core.Disposable;
import reactor.core.publisher.Mono;
import reactor.core.publisher.Sinks;
import reactor.util.function.Tuple2;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.dto.OutputWarningDto;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.entity.StatisticValueEntity;
import ru.evrazhackaton.service.service.AnalyzeService;
import ru.evrazhackaton.service.service.ExgausterService;
import ru.evrazhackaton.service.service.MappingService;
import ru.evrazhackaton.service.service.StatisticValueService;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class AnalyzeServiceImpl implements AnalyzeService {
    MappingService mappingService;
    StatisticValueService statisticValueService;
    ExgausterService exgausterService;
    Sinks.Many<OutputWarningDto> realTimeWarningsSink;

    @Override
    @PostConstruct
    public Disposable analyse(){
        return exgausterService.getRealTimeInput()
                .flatMap(inputExgausterMomentDto -> Mono.zip(Mono.just(inputExgausterMomentDto), mappingService.getByPlace(inputExgausterMomentDto.getKey())))
                .flatMap(tuple -> Mono.zip(Mono.just(tuple), statisticValueService.getByMappingId(tuple.getT2().getId()).defaultIfEmpty(new StatisticValueEntity())))
                /*.flatMap(tuple -> {
                    Tuple2<InputExgausterMomentDto, MappingEntity> data = tuple.getT1();
                    InputExgausterMomentDto exgausterMomentDto = data.getT1();
                    MappingEntity mapping = data.getT2();
                    StatisticValueEntity statisticValue = tuple.getT2();
                })*/
                .subscribe();
    }
}
