package org.igye.textparser;

import lombok.val;
import org.junit.Assert;
import org.junit.Test;

import java.io.ByteArrayInputStream;

public class ParsersTest {

    @Test
    public void integer_parsesIntegers() {
        //when
        val parseResult = Parsers.integer().parse(
                Parsers.inputStreamToTokenStream(new ByteArrayInputStream("639:12".getBytes()))
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
}