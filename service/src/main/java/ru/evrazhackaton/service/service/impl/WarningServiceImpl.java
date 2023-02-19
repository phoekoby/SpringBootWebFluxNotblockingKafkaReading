package ru.evrazhackaton.service.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.publisher.Sinks;
import ru.evrazhackaton.service.dto.OutputWarningDto;
import ru.evrazhackaton.service.entity.WarningEntity;
import ru.evrazhackaton.service.repository.WarningRepository;
import ru.evrazhackaton.service.service.MappingService;
import ru.evrazhackaton.service.service.WarningsService;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class WarningServiceImpl implements WarningsService {
    Sinks.Many<OutputWarningDto> realTimeWarningsSink;
    WarningRepository warningRepository;
    MappingService mappingService;

    @Override
    public Flux<OutputWarningDto> getAllByExgausterNumber(Integer exgauster, Pageable pageable) {
        return warningRepository.getAllByExgauster(exgauster, pageable)
                .flatMap(this::mapToOutput);
    }

    private Mono<OutputWarningDto> mapToOutput(WarningEntity warningEntity){
        return mappingService.getById(warningEntity.getMappingId())
                .map(mappingEntity -> OutputWarningDto.builder()
                        .active(mappingEntity.getActive())
                        .comment(mappingEntity.getComment())
                        .exgauster(mappingEntity.getExgauster())
                        .reason(warningEntity.getReason())
                        .warningType(warningEntity.getWarningType())
                        .build());
    }

    @Override
    public Flux<OutputWarningDto> getAll(Pageable pageable) {
        return warningRepository.findAllBy(pageable)
                .flatMap(this::mapToOutput);
    }

    @Override
    public Flux<OutputWarningDto> getRealTime() {
        return realTimeWarningsSink.asFlux();
    }

    @Override
    public Flux<OutputWarningDto> getRealTimeByExgauster(Integer number) {
        return getRealTime().filter(outputWarningDto -> outputWarningDto.getExgauster().equals(number));
    }
}
