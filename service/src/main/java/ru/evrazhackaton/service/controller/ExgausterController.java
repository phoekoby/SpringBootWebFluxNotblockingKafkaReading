package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.ExgausterMomentDto;
import ru.evrazhackaton.service.service.ExgausterService;

import java.time.Duration;
import java.util.Comparator;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class ExgausterController {
    ExgausterService exgausterService;

    @GetMapping("/exgauster-stream-info-sse/{number}")
    public Flux<ServerSentEvent<ExgausterMomentDto>> subscribeForExgausterSse(@PathVariable Integer number){
        Flux<ExgausterMomentDto> byExgausterNumber = exgausterService.getByExgausterNumber(number);
        Flux<ExgausterMomentDto> listenCurrent = exgausterService.listenToSaved(number);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .map(event -> ServerSentEvent.<ExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/listen-exgauster/{number}")
    public Flux<ServerSentEvent<ExgausterMomentDto>> onlyListen(@PathVariable Integer number){
        Flux<ExgausterMomentDto> mp = exgausterService.listenToSaved(number);
         return mp.map(event -> ServerSentEvent.<ExgausterMomentDto>builder()
                    .retry(Duration.ofSeconds(4L))
                    .event(event.getClass().getSimpleName())
                    .data(event)
                    .build());
    }




}
