package ru.evrazhackaton.service.mapper;

public interface EntityMapper<E, D> {
    E mapFromDto(D dto);
    D mapFromEntity(E entity);
}