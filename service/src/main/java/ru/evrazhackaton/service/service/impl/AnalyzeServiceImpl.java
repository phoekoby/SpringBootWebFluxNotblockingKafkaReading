package ru.evrazhackaton.service.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputWarningDto;
import ru.evrazhackaton.service.repository.ExgausterMomentRepository;
import ru.evrazhackaton.service.service.AnalyzeService;
import ru.evrazhackaton.service.service.MappingService;
import ru.evrazhackaton.service.service.StatisticValueService;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class AnalyzeServiceImpl implements AnalyzeService {
    MappingService mappingService;
    StatisticValueService statisticValueService;
    private final ExgausterMomentRepository exgausterMomentRepository;

   /* @PostConstruct
    private Disposable analyse(){
        notificationService.listen(NotificationTopic.MOMENT_SAVED, ExgausterMoment.class)
                .flatMap(exgausterMoment -> Mono.zip(Mono.just(exgausterMoment), statisticValueService.getByMappingId(exgausterMoment.getMappingId()).defaultIfEmpty(new StatisticValue())))
                .flatMap(tuple -> {
                    StatisticValue exists = tuple.getT2();
                    ExgausterMoment moment = tuple.getT1();
                    if(exists.getId() == null){
                        exists.setMappingId(moment.getMappingId());
                        exists.setMaxValue(moment.getValue());
                        exists.setMaxDeltaValue(0.0);
                        exists.setMinDeltaValue(0.0);
                        return statisticValueService.save(exists);
                    }else{
                        Double currentMax = exists.getMaxValue();
                        Double currentMin = exists.getMinValue();
                        Double prevValue = exists.getCurrValue();
                        Double currValue = moment.getValue();

                        double delta = Math.abs(currValue - prevValue);
                        exists.setCurrValue(moment.getValue());
                        BigDecimal result = new BigDecimal(exists.getAllSummedValue()).add(BigDecimal.valueOf(moment.getValue()));
                        exists.setAllSummedValue(result.toString());
                        exists.setCountOfAll(exists.getCountOfAll()+1);
                        BigDecimal abs = result.divide(BigDecimal.valueOf(exists.getCountOfAll()));
                        BigDecimal diffentWithMe = abs.min(new BigDecimal(currValue));
                        outputSink.tryEmitNext();

                    }
                })
    }*/

    @Override
    public Flux<OutputWarningDto> getWarnings() {
        return null;
    }

    @Override
    public Flux<OutputWarningDto> getWarnings(Integer exgauster) {
        return null;
    }
}
