package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Sinks;
import ru.evrazhackaton.service.dto.InputExgausterMomentDto;
import ru.evrazhackaton.service.dto.OutputExgausterMomentDto;
import ru.evrazhackaton.service.service.ExgausterService;

import java.time.Duration;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@CrossOrigin
public class ExgausterController {
    ExgausterService exgausterService;
    Sinks.Many<InputExgausterMomentDto> realTimeExgausterSink;

    @GetMapping("/exgauster-history-with-realtime/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTime(@PathVariable Integer number){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getByExgausterNumber(number);
        Flux<OutputExgausterMomentDto> listenCurrent = realTimeExgausterSink.asFlux().flatMap(exgausterService::convert);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-history/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistory(@PathVariable Integer number){
        return exgausterService.getByExgausterNumber(number)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-realtime/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTime(@PathVariable Integer number){
        return realTimeExgausterSink.asFlux()
                .flatMap(exgausterService::convert)
                .filter(outputExgausterMomentDto -> outputExgausterMomentDto.getExgausterId().equals(number))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTimeForAll(){
        return realTimeExgausterSink.asFlux()
                .flatMap(exgausterService::convert)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistoryForAll(){
        return exgausterService.getAll()
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history-with-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTimeForAll(){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getAll();
        Flux<OutputExgausterMomentDto> listenCurrent = realTimeExgausterSink.asFlux().flatMap(exgausterService::convert);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }




}
