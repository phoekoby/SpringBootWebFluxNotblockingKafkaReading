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
import ru.evrazhackaton.service.repository.ExgausterMomentRepository;
import ru.evrazhackaton.service.service.ExgausterService;
import ru.evrazhackaton.service.service.MappingService;

@Service
@RequiredArgsConstructor
@Slf4j
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterServiceImpl implements ExgausterService {
    ExgausterMomentRepository exgausterMomentRepository;
    MappingService mappingService;
    static final Sort exgaustedSort = Sort.by(Sort.Direction.DESC,"moment");

    @Override
    public Flux<OutputExgausterMomentDto> saveAll(Flux<InputExgausterMomentDto> exgausterMomentDtoFlux) {
        return exgausterMomentRepository.saveAll(exgausterMomentDtoFlux.flatMap(this::mapFromInput))
                .flatMap(this::mapToOutput);
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
    public Mono<OutputExgausterMomentDto> save(InputExgausterMomentDto dto) {
        return Mono
                .just(dto)
                .flatMap(this::mapFromInput)
                .flatMap(exgausterMomentRepository::save)
                .flatMap(this::mapToOutput);
    }

    @Override
    public Mono<OutputExgausterMomentDto> convert(InputExgausterMomentDto dto) {
        return mappingService.getByPlace(dto.getKey())
                .map(mappingEntity -> OutputExgausterMomentDto.builder()
                        .moment(dto.getMoment())
                        .exgausterId(mappingEntity.getExgauster())
                        .code(mappingEntity.getPlace())
                        .value(dto.getValue())
                        .signalType(mappingEntity.getType())
                        .active(mappingEntity.getActive())
                        .comment(mappingEntity.getComment())
                        .build());
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
}
