package ru.evrazhackaton.service.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OutputWarningDto {
    Integer exgauster;
    String comment;
    String reason;
    WarningType warningType;
}
