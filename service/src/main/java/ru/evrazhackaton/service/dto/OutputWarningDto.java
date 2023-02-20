package ru.evrazhackaton.service.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.CreatedDate;
import ru.evrazhackaton.service.entity.WarningType;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OutputWarningDto {

    Integer exgauster;

    String comment;

    Integer active;

    String reason;

    WarningType warningType;
}
