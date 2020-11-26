package org.igye.common;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;

import java.io.File;
import java.io.InputStream;

public class Utils {
    private final static ObjectMapper MAPPER = new ObjectMapper();

    public static InputStream inputStreamFromClasspath(String path) {
        return Utils.class.getResourceAsStream(path);
    }

    @SneakyThrows
    public static void saveDtoToFile(Object dto, String filePath) {
        MAPPER.writeValue(new File(filePath), dto);
    }
}
