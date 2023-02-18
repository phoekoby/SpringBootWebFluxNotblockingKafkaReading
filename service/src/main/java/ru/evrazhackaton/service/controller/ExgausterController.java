package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputExgausterMomentDto;
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
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTime(@PathVariable Integer number){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getByExgausterNumber(number);
        Flux<OutputExgausterMomentDto> listenCurrent = exgausterService.listenToSaved(number);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-history/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistory(@PathVariable Integer number){
        return exgausterService.getByExgausterNumber(number)
                .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-realtime/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTime(@PathVariable Integer number){
         return exgausterService.listenToSaved(number)
                 .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                 .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                    .retry(Duration.ofSeconds(4L))
                    .event(event.getClass().getSimpleName())
                    .data(event)
                    .build());
    }

    @GetMapping("/exgausters-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTimeForAll(){
        return exgausterService.listenToSaved()
                .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistoryForAll(){
        return exgausterService.getAll()
                .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history-with-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTimeForAll(){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getAll();
        Flux<OutputExgausterMomentDto> listenCurrent = exgausterService.listenToSaved();
        return Flux.merge(byExgausterNumber, listenCurrent)
                .sort(Comparator.comparing(OutputExgausterMomentDto::getMoment))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }




}
