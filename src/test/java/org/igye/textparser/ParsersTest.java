package org.igye.textparser;

import lombok.val;
import org.junit.Assert;
import org.junit.Test;

import java.io.ByteArrayInputStream;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.opt;
import static org.igye.textparser.Parsers.rep;

public class ParsersTest {

    @Test
    public void integer_parsesIntegers() {
        //when
        val parseResult = Parsers.integer().parse(
                tokenStreamFromString("639:12")
        );

        //then
        Assert.assertEquals(639, parseResult.getResult().get().intValue());
        Assert.assertEquals(':', parseResult.getRemainingTokens().head().value().charValue());
        final PositionRange<PositionInText> positionRange = parseResult.getPositionRange();
        Assert.assertEquals(0, positionRange.getStart().getLine());
        Assert.assertEquals(0, positionRange.getStart().getCol());
        Assert.assertEquals(0, positionRange.getEnd().getLine());
        Assert.assertEquals(2, positionRange.getEnd().getCol());
    }

    @Test
    public void literal_parsesLiterals() {
        //when
        val parseResult = Parsers.literal("define").parse(
                tokenStreamFromString("define a: A")
        );

        //then
        Assert.assertEquals("define", parseResult.getResult().get());
        Assert.assertEquals(' ', parseResult.getRemainingTokens().head().value().charValue());
        final PositionRange<PositionInText> positionRange = parseResult.getPositionRange();
        Assert.assertEquals(0, positionRange.getStart().getLine());
        Assert.assertEquals(0, positionRange.getStart().getCol());
        Assert.assertEquals(0, positionRange.getEnd().getLine());
        Assert.assertEquals(5, positionRange.getEnd().getCol());
    }

    @Test
    public void parserCombinatorsShouldWorkCorrectly() {
        //given
        val integer = Parsers.integer();
        val comma = Parsers.literal(",");
        val arrElem = and(opt(comma), integer);
        val inpArgs = rep("Non empty list of input arguments", arrElem);

        //when
        val parseResult = inpArgs.parse(
                tokenStreamFromString("93,57,17")
        );

        //then
        Assert.assertTrue(parseResult.isSuccess());
    }

    private TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return Parsers.inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }
}