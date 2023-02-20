package ru.evrazhackaton.service.dto;


import lombok.*;
import lombok.experimental.FieldDefaults;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OutputExgausterMomentDto {
    Integer exgausterId;
    String signalType;
    String comment;
    Integer active;
    Double value;
    Timestamp moment;
    String code;

}
