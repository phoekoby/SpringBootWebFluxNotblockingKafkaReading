package ru.evrazhackaton.service.mapper;

import org.springframework.stereotype.Component;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;

@Component
public class ExgausterMomentMapper implements EntityMapper<ExgausterMoment, ExgausterMomentDto> {
    @Override
    public ExgausterMoment mapFromDto(ExgausterMomentDto dto) {
        return null;
    }

    @Override
    public ExgausterMomentDto mapFromEntity(ExgausterMoment entity) {
        return null;
    }

    @Override
    public void update(ExgausterMoment entity, ExgausterMomentDto dto) {

    }
}
