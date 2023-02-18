package ru.evrazhackaton.service.entity;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Timestamp;

@Table
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ExgausterMoment {

    @Id
    Long id;

    @Column("key")
    String key;

    @Column("value")
    Double value;

    @Column("moment")
    Timestamp moment;
}
