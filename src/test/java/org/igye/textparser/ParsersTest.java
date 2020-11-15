package org.igye.textparser;

import org.junit.Assert;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Optional;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.opt;
import static org.igye.textparser.Parsers.rec;
import static org.igye.textparser.TextParsers.inputStreamToTokenStream;
import static org.igye.textparser.TextParsers.literal;
import static org.junit.Assert.assertEquals;

public class ParsersTest {
    @Test
    public void rec_shouldProduceRecursiveParser() {
        //when
        final ParseResult<TokenStream<Character, PositionInText>, List, PositionInText> parseResult =
                recursiveParser().parse(tokenStreamFromString("AAA"));

        //then
        Assert.assertTrue(parseResult.isSuccess());
        assertEquals("A", parseResult.get().get(0));
        assertEquals("A", ((Optional<List>) parseResult.get().get(1)).get().get(0));
        assertEquals(
                "A",
                ((Optional<List>) ((Optional<List>) parseResult.get().get(1)).get().get(1)).get().get(0)
        );
    }

    private Parser<TokenStream<Character, PositionInText>, List, PositionInText> recursiveParser() {
        return and(literal("A"),opt(rec(() -> recursiveParser())));
    }



    private TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }
}