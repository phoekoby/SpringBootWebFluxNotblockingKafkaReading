package ru.evrazhackaton.service.entity;


import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.io.Serializable;

@Table("mapping")
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class MappingEntity implements Serializable {
    @Id
    Long id;

    @Column("place")
    String place;

    @Column("type")
    String type;

    @Column("comment")
    String comment;

    @Column("exgauster")
    Integer exgauster;

    @Column("active")
    Integer active;
}
