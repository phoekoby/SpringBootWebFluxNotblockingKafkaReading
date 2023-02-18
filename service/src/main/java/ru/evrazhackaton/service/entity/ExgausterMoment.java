package ru.evrazhackaton.service.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;
import lombok.experimental.Accessors;
import lombok.experimental.FieldDefaults;
import lombok.extern.jackson.Jacksonized;
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
@ToString
@Jacksonized
public class ExgausterMoment {
    @Id
    Long id;

    @Column("key")
    String key;

    @JsonProperty("mapping_id")
    @Column("mapping_id")
    Long mappingId;

    @Column("value")
    Double value;

    @Column("exgauster")
    Integer exgauster;

    @Column("moment")
    Timestamp moment;
}
