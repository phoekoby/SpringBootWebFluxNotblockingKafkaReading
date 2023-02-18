package ru.evrazhackaton.service.service.impl;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.service.MappingService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class MappingServiceImpl implements MappingService {
    MappingRepository mappingRepository;


    @Override
    public List<String> getAllPlacesByExgauster(Integer exgauster) {
        return mappingRepository.getAllByExgauster(exgauster).map(MappingEntity::getPlace).toStream().collect(Collectors.toList());
    }
}
