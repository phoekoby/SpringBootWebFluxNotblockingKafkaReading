package ru.evrazhackaton.service.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;
import ru.evrazhackaton.service.entity.NotificationTopic;
import ru.evrazhackaton.service.mapper.EntityMapper;
import ru.evrazhackaton.service.repository.ExgausterMomentRepository;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.service.ExgausterService;
import ru.evrazhackaton.service.service.NotificationService;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterServiceImpl implements ExgausterService {
    ExgausterMomentRepository exgausterMomentRepository;
    MappingRepository mappingRepository;
    EntityMapper<ExgausterMoment, ExgausterMomentDto> entityMapper;
    NotificationService notificationService;
    static final Sort exgaustedSort = Sort.by(Sort.Direction.DESC,"moment");

    @Override
    public Flux<ExgausterMomentDto> saveAll(Flux<ExgausterMomentDto> exgausterMomentDtoFlux) {
        return exgausterMomentRepository.saveAll(exgausterMomentDtoFlux.map(entityMapper::mapFromDto)
                        .flatMap(this::setMappingId))
                .map(entityMapper::mapFromEntity);
    }

    private Mono<ExgausterMoment> setMappingId(ExgausterMoment exgausterMoment) {
        return mappingRepository.getByPlace(exgausterMoment.getKey())
                .map(mappingEntity -> exgausterMoment.setMappingId(mappingEntity.getId())
                        .setExgauster(mappingEntity.getExgauster()));
    }

    @Override
    public Flux<ExgausterMomentDto> getByExgausterNumber(Integer number) {
        return exgausterMomentRepository
                .getAllByExgauster(number, exgaustedSort)
                .map(entityMapper::mapFromEntity);
    }

    @Override
    public Flux<ExgausterMomentDto> listenToSaved() {
        return notificationService.listen(NotificationTopic.MOMENT_SAVED, ExgausterMoment.class)
                .map(entityMapper::mapFromEntity);
    }

    @Override
    public Mono<ExgausterMomentDto> save(ExgausterMomentDto dto) {
        return Mono
                .just(dto)
                .map(entityMapper::mapFromDto)
                .flatMap(this::setMappingId)
                .flatMap(exgausterMomentRepository::save)
                .map(entityMapper::mapFromEntity);
    }
}
