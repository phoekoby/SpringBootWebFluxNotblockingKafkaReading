package ru.evrazhackaton.service.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.evrazhackaton.service.entity.MappingEntity;
import ru.evrazhackaton.service.service.MappingService;

import java.util.List;

@RestController
@RequestMapping("/blocking-api")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class MappingRepository {
    MappingService mappingService;

    @GetMapping("/mappings")
    public List<MappingEntity> getAllMapping(){
        return mappingService.getAll().collectList().block();
    }
}
