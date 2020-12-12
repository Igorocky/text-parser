package org.igye.metamath;

import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;

import java.io.ByteArrayInputStream;

import static org.igye.textparser.TextParsers.inputStreamToTokenStream;

public class TestUtils {

    public static TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }
}
