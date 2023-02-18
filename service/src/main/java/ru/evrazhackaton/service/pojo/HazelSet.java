package ru.evrazhackaton.service.pojo;

import com.hazelcast.collection.ISet;
import com.hazelcast.map.IMap;
import lombok.Data;

import java.util.Objects;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.TimeUnit;

@Data
public class HazelSet<T> {
    private final IMap<T, T> map;
    private final int defaultTtl;
    private final TimeUnit defaultTimeUnit;

    public boolean add(T value){
        return !Objects.equals(map.put(value, value, defaultTtl, defaultTimeUnit), value);
    }

    public boolean add(T value, int ttl, TimeUnit timeUnit){
        return !Objects.equals(map.put(value, value, ttl, timeUnit), value);
    }

    public CompletionStage<T> addAsync(T value){
        return map.putAsync(value, value);
    }



    public boolean contains(T value){
        return map.containsKey(value);
    }


    public void delete(T value){
        map.delete(value);
    }

    public boolean remove(T value){
        return map.remove(value) == value;
    }

    public void clear(){
        map.clear();
    }
}
