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

    @GetMapping("/exgauster-history-with-realtime/{number}")
    public Flux<ServerSentEvent<ExgausterMomentDto>> getHistoryWithRealTime(@PathVariable Integer number){
        Flux<ExgausterMomentDto> byExgausterNumber = exgausterService.getByExgausterNumber(number);
        Flux<ExgausterMomentDto> listenCurrent = exgausterService.listenToSaved(number);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .sort(Comparator.comparing(ExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<ExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-realtime/{number}")
    public Flux<ServerSentEvent<ExgausterMomentDto>> getOnlyRealTime(@PathVariable Integer number){
         return exgausterService.listenToSaved(number)
                 .sort(Comparator.comparing(ExgausterMomentDto::getMoment))
                 .map(event -> ServerSentEvent.<ExgausterMomentDto>builder()
                    .retry(Duration.ofSeconds(4L))
                    .event(event.getClass().getSimpleName())
                    .data(event)
                    .build());
    }

    @GetMapping("/exgauster-realtime/{number}")
    public Flux<ServerSentEvent<ExgausterMomentDto>> getOnlyHistory(@PathVariable Integer number){
        return exgausterService.getByExgausterNumber(number)
                .sort(Comparator.comparing(ExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<ExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }




}
