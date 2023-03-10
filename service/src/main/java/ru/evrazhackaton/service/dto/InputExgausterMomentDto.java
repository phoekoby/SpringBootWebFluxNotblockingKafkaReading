package ru.evrazhackaton.service.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class InputExgausterMomentDto {
    String key;
    Double value;
    Timestamp moment;
}
