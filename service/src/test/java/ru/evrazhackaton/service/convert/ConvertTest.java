package ru.evrazhackaton.service.convert;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class ConvertTest {


    @SneakyThrows
    @Test
    public void convertTest() throws JsonProcessingException {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> map1 = (Map<String, String>)objectMapper.readValue(ConvertTest.class.getClassLoader().getResource("test.json"), Map.class);
        System.out.println(map1);
    }
}
