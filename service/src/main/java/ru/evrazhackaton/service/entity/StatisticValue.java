package ru.evrazhackaton.service.entity;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table("statistic_value")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StatisticValue {

    @Id
    Long id;

    @Column("mapping_id")
    Long mappingId;

    @Column("max_value")
    Double maxValue;

    @Column("min_value")
    Double minValue;

    @Column("curr_value")
    Double currValue;

    @Column("max_delta_value")
    Double maxDeltaValue;

    @Column("min_delta_value")
    Double minDeltaValue;

    @Column("all_summed_value")
    String allSummedValue;

    @Column("count_of_all")
    Long countOfAll;
}
