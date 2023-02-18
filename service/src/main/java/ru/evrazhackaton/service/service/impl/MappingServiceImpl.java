package ru.evrazhackaton.service.service.impl;

import com.hazelcast.core.HazelcastInstance;
import com.hazelcast.map.IMap;
import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.stereotype.Service;
import reactor.cache.CacheMono;
import reactor.core.publisher.Mono;
import reactor.core.publisher.Signal;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.repository.MappingRepository;
import ru.evrazhackaton.service.service.MappingService;

import java.util.List;
import java.util.Map;

@Service
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class MappingServiceImpl implements MappingService {
    MappingRepository mappingRepository;

    @Override
    public Mono<MappingEntity> getById(Long id) {
        return mappingRepository.findById(id);
    }
    @Override
    public Mono<MappingEntity> getByPlace(String place) {
        return mappingRepository.getByPlace(place);
    }

}
