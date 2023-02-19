package ru.evrazhackaton.service.service.impl;

import jakarta.annotation.PostConstruct;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.core.Disposable;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.OutputWarningDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.entity.StatisticValue;
import ru.evrazhackaton.service.repository.StatisticValueRepository;
import ru.evrazhackaton.service.service.AnalyzeService;
import ru.evrazhackaton.service.service.MappingService;
import ru.evrazhackaton.service.service.NotificationService;
import ru.evrazhackaton.service.service.StatisticValueService;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class AnalyzeServiceImpl implements AnalyzeService {
    NotificationService notificationService;
    MappingService mappingService;
    StatisticValueService statisticValueService;


    @PostConstruct
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

                        if(currValue > currentMax){
                            double deltaBetweenCurrentAndMax = currValue - currentMax;

                        }else if(currValue < currentMin){

                        }

                    }
                })
    }

    @Override
    public Flux<OutputWarningDto> getWarnings() {
        return null;
    }

    @Override
    public Flux<OutputWarningDto> getWarnings(Integer exgauster) {
        return null;
    }
}
