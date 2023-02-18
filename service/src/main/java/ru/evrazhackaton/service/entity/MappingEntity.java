package ru.evrazhackaton.service.entity;


import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class MappingEntity {
    @Id
    Long id;

    String place;

    String type;

    String code;

    Integer exgauster;

    Integer active;
}
