package ru.evrazhackaton.service.entity;

import lombok.*;
import lombok.experimental.Accessors;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.sql.Timestamp;

@Table
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
@Accessors(chain = true)
public class ExgausterMoment {
    @Id
    Long id;

    @Column("key")
    String key;

    @Column("mapping_id")
    Long mappingId;

    @Column("value")
    Double value;

    @Column("moment")
    Timestamp moment;
}
