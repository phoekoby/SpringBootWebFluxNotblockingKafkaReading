package ru.evrazhackaton.service.entity;


import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import java.io.Serializable;

@Table("mapping")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class MappingEntity implements Serializable {
    @Id
    Long id;

    String place;

    String type;

    String comment;

    Integer exgauster;

    Integer active;
}