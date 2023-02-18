package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.service.ExgausterService;

@RestController("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterController {
    ExgausterService exgausterService;
    @GetMapping("/exgauster-stream-info")
    public Flux<ExgausterMomentDto> subscribeForExgauster(@RequestParam(value = "exgauster") Integer numberOfExgauster){
        exgausterService.getByExgausterNumber(numberOfExgauster).subscribe(System.out::println);
        return exgausterService.getByExgausterNumber(numberOfExgauster);
    }
}
