package ru.evrazhackaton.service.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.dto.OutputExgausterMomentDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.repository.ExgausterMomentRepository;
import ru.evrazhackaton.service.service.ExgausterService;
import ru.evrazhackaton.service.service.MappingService;
import ru.evrazhackaton.service.service.NotificationService;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterServiceImpl implements ExgausterService {
    ExgausterMomentRepository exgausterMomentRepository;
    MappingService mappingService;
    NotificationService notificationService;
    static final Sort exgaustedSort = Sort.by(Sort.Direction.DESC,"moment");

    @Override
    public Flux<OutputExgausterMomentDto> saveAll(Flux<InputExgausterMomentDto> exgausterMomentDtoFlux) {
        return exgausterMomentRepository.saveAll(exgausterMomentDtoFlux.flatMap(this::mapFromInput))
                .flatMap(this::mapToOutput);
    }

    private Mono<ExgausterMoment> mapFromInput(InputExgausterMomentDto inputExgausterMomentDto){
        return mappingService.getByPlace(inputExgausterMomentDto.getKey())
                .map(mappingEntity -> ExgausterMoment.builder()
                        .exgauster(mappingEntity.getExgauster())
                        .mappingId(mappingEntity.getId())
                        .key(inputExgausterMomentDto.getKey())
                        .value(inputExgausterMomentDto.getValue())
                        .moment(inputExgausterMomentDto.getMoment())
                        .build());
    }

    private Mono<OutputExgausterMomentDto> mapToOutput(ExgausterMoment exgausterMoment){
        return mappingService.getById(exgausterMoment.getMappingId())
                .map(mappingEntity -> OutputExgausterMomentDto.builder()
                        .exgausterId(mappingEntity.getExgauster())
                        .active(mappingEntity.getActive())
                        .comment(mappingEntity.getComment())
                        .signalType(mappingEntity.getType())
                        .value(exgausterMoment.getValue())
                        .code(exgausterMoment.getKey())
                        .moment(exgausterMoment.getMoment())
                        .build());
    }

    @Override
    public Flux<OutputExgausterMomentDto> getByExgausterNumber(Integer number) {
        return exgausterMomentRepository
                .getAllByExgauster(number, exgaustedSort)
                .flatMap(this::mapToOutput);
    }

    @Override
    public Flux<OutputExgausterMomentDto> getAll() {
        return exgausterMomentRepository.findAll(exgaustedSort)
                .flatMap(this::mapToOutput);
    }

    @Override
    public Flux<OutputExgausterMomentDto> listenToSaved(Integer number) {
        return notificationService.listen(NotificationTopic.MOMENT_SAVED, ExgausterMoment.class)
                .flatMap(this::mapToOutput)
                .filter(exgausterMomentDto -> exgausterMomentDto.getExgausterId().equals(number));
    }

    @Override
    public Flux<OutputExgausterMomentDto> listenToSaved() {
        return notificationService.listen(NotificationTopic.MOMENT_SAVED, ExgausterMoment.class)
                .flatMap(this::mapToOutput);
    }

    @Override
    public Mono<OutputExgausterMomentDto> save(InputExgausterMomentDto dto) {
        return Mono
                .just(dto)
                .flatMap(this::mapFromInput)
                .flatMap(exgausterMomentRepository::save)
                .flatMap(this::mapToOutput);
    }
}
