package org.igye.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import lombok.SneakyThrows;

import java.io.File;
import java.io.InputStream;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils {
    private final static ObjectMapper MAPPER;
    static {
        MAPPER = new ObjectMapper();
        MAPPER.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        MAPPER.configure(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS, true);
    }

    public static InputStream inputStreamFromClasspath(String path) {
        return Utils.class.getResourceAsStream(path);
    }

    @SneakyThrows
    public static void saveDtoToFile(Object dto, String filePath) {
        MAPPER.writeValue(new File(filePath), dto);
    }

    @SneakyThrows
    public static <T> T parse(String str, TypeReference<T> typeRef) {
        return MAPPER.readValue(str, typeRef);
    }

    @SneakyThrows
    public static String toJson(Object dto) {
        return MAPPER.writeValueAsString(dto);
    }

    public static String replace(String content, Pattern pattern, Function<Matcher, String> replacement) {
        Matcher matcher = pattern.matcher(content);
        StringBuilder newContent = new StringBuilder();
        int prevEnd = 0;
        while (matcher.find()) {
            newContent.append(content, prevEnd, matcher.start());
            final String replacementValue = replacement.apply(matcher);
            if (replacementValue != null) {
                newContent.append(replacementValue);
            } else {
                newContent.append(matcher.group(0));
            }
            prevEnd = matcher.end();
        }
        newContent.append(content, prevEnd, content.length());
        return newContent.toString();
    }
}
