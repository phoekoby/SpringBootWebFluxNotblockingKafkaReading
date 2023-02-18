package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.entity.ExgausterMoment;
import ru.evrazhackaton.service.service.ExgausterService;

@RestController
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterController {
    ExgausterService exgausterService;


    public Flux<ExgausterMomentDto> subscribeForExgauster(@RequestParam Integer numberOfExgauster){
        return exgausterService.getByExgausterNumber(numberOfExgauster);
    }
}
