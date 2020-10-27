package org.igye.textparser;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Parsers {
    @lombok.SneakyThrows
    public static TokenStream<Character> inputStreamToTokenStream(InputStream inputStream) {
        final BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
        bufferedReader.
    }
}
