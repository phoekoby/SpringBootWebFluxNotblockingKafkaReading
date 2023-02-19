package ru.evrazhackaton.service.controller;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import ru.evrazhackaton.service.dto.OutputWarningDto;
import ru.evrazhackaton.service.service.WarningsService;

@RestController
@RequestMapping("/api")
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
@RequiredArgsConstructor
public class WarningController {
    WarningsService warningsService;

    @GetMapping("/exgauster-warnings-history-with-realtime/{number}")
    public Flux<OutputWarningDto> getWarningsByExgausterRealTimeWithHistory(@PathVariable Integer number,
                                                         @RequestParam(defaultValue = "1", required = false) int page,
                                                         @RequestParam(defaultValue = "20", required = false) int size,
                                                         @RequestParam(defaultValue = "create_date", required = false) String sort){
        Flux<OutputWarningDto> allByExgausterNumber = warningsService.getAllByExgausterNumber(number, PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
        Flux<OutputWarningDto> realTimeByExgauster = warningsService.getRealTimeByExgauster(number);
        return Flux.merge(allByExgausterNumber, realTimeByExgauster);
    }

    @GetMapping("/exgauster-warnings-history/{number}")
    public Flux<OutputWarningDto> getWarningsByExgausterHistory(@PathVariable Integer number,
                                                         @RequestParam(defaultValue = "1", required = false) int page,
                                                         @RequestParam(defaultValue = "20", required = false) int size,
                                                         @RequestParam(defaultValue = "create_date", required = false) String sort){
        return warningsService.getAllByExgausterNumber(number, PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
    }

    @GetMapping("/exgauster-warnings-realtime/{number}")
    public Flux<OutputWarningDto> getWarningsByExgausterRealTime(@PathVariable Integer number,
                                                                @RequestParam(defaultValue = "1", required = false) int page,
                                                                @RequestParam(defaultValue = "20", required = false) int size,
                                                                @RequestParam(defaultValue = "create_date", required = false) String sort){
        return warningsService.getRealTimeByExgauster(number);
    }

    @GetMapping("/exgausters-warnings-history-with-realtime")
    public Flux<OutputWarningDto> getWarningsByExgausterRealTimeWithHistory(@RequestParam(defaultValue = "1", required = false) int page,
                                                                            @RequestParam(defaultValue = "20", required = false) int size,
                                                                            @RequestParam(defaultValue = "create_date", required = false) String sort){
        Flux<OutputWarningDto> allByExgausterNumber = warningsService.getAll(PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
        Flux<OutputWarningDto> realTimeByExgauster = warningsService.getRealTime();
        return Flux.merge(allByExgausterNumber, realTimeByExgauster);
    }

    @GetMapping("/exgausters-warnings-history")
    public Flux<OutputWarningDto> getWarningsHistory(@RequestParam(defaultValue = "1", required = false) int page,
                                                                @RequestParam(defaultValue = "20", required = false) int size,
                                                                @RequestParam(defaultValue = "create_date", required = false) String sort){
        return warningsService.getAll(PageRequest.of(page, size, Sort.by(Sort.Order.by(sort))));
    }

    @GetMapping("/exgausters-warnings-realtime")
    public Flux<OutputWarningDto> getWarningsRealTime(){
        return warningsService.getRealTime();
    }

}
