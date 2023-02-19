package ru.evrazhackaton.service.controller;


import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
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

    @GetMapping("/exgauster-history-with-realtime/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTime(@PathVariable Integer number,
                                                                                  @RequestParam(defaultValue = "1", required = false) int page,
                                                                                  @RequestParam(defaultValue = "20", required = false) int size,
                                                                                  @RequestParam(defaultValue = "moment", required = false) String sort){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getByExgausterNumber(number, PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
        Flux<OutputExgausterMomentDto> listenCurrent = exgausterService.getRealTimeByExgausterNumber(number);
        return Flux.merge(byExgausterNumber, listenCurrent)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-history/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistory(@PathVariable Integer number,
                                                                          @RequestParam(defaultValue = "1", required = false) int page,
                                                                          @RequestParam(defaultValue = "20", required = false) int size,
                                                                          @RequestParam(defaultValue = "moment", required = false) String sort){
        return exgausterService.getByExgausterNumber(number, PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgauster-realtime/{number}")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTime(@PathVariable Integer number){
        return exgausterService.getRealTimeByExgausterNumber(number)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyRealTimeForAll(){
        return exgausterService.getRealTimeOutput()
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getOnlyHistoryForAll(@RequestParam(defaultValue = "1", required = false) int page,
                                                                                @RequestParam(defaultValue = "20", required = false) int size,
                                                                                @RequestParam(defaultValue = "moment", required = false) String sort){
        return exgausterService.getAll(PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))))
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }

    @GetMapping("/exgausters-history-with-realtime")
    public Flux<ServerSentEvent<OutputExgausterMomentDto>> getHistoryWithRealTimeForAll(@RequestParam(defaultValue = "1", required = false) int page,
                                                                                         @RequestParam(defaultValue = "20", required = false) int size,
                                                                                         @RequestParam(defaultValue = "moment", required = false) String sort){
        Flux<OutputExgausterMomentDto> byExgausterNumber = exgausterService.getAll(PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
        Flux<OutputExgausterMomentDto> listenCurrent = exgausterService.getRealTimeOutput();
        return Flux.merge(byExgausterNumber, listenCurrent)
                .map(event -> ServerSentEvent.<OutputExgausterMomentDto>builder()
                        .retry(Duration.ofSeconds(4L))
                        .event(event.getClass().getSimpleName())
                        .data(event)
                        .build());
    }




}
