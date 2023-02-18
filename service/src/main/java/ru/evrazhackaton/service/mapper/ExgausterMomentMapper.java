package ru.evrazhackaton.service.mapper;

import org.springframework.stereotype.Component;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;

@Component
public class ExgausterMomentMapper implements EntityMapper<ExgausterMoment, ExgausterMomentDto> {
    @Override
    public ExgausterMoment mapFromDto(ExgausterMomentDto dto) {
        return ExgausterMoment
                .builder()
                .moment(dto.getMoment())
                .key(dto.getKey())
                .value(dto.getValue())
                .exgauster(dto.getExgauster())
                .build();
    }

    @Override
    public ExgausterMomentDto mapFromEntity(ExgausterMoment entity) {
        return ExgausterMomentDto
                .builder()
                .moment(entity.getMoment())
                .key(entity.getKey())
                .value(entity.getValue())
                .exgauster(entity.getExgauster())
                .build();
    }
}
