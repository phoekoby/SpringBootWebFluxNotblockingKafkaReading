package ru.evrazhackaton.service.entity;


import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.util.Date;

@Table("warning")
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WarningEntity {
    @Id
    Long id;

    @Column("mapping_id")
    Long mappingId;

    @Column("reason")
    String reason;

    @Column("warning_type")
    WarningType warningType;

    @Column("create_date")
    @CreatedDate
    Date createDate;

    @Column("update_date")
    @LastModifiedDate
    Date updateDate;
}
