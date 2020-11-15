package org.igye.metamath;

import org.igye.common.Utils;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.util.Arrays;

import static org.igye.textparser.TextParsers.inputStreamToTokenStream;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class MetamathParsersTest {
    @Test
    public void preprocess_shouldPreprocessMetamathFile() {
        //when
        final Preprocessed preprocessed = MetamathParsers.preprocess(Utils.inputStreamFromClasspath("/peano.mm"));
//        final Preprocessed preprocessed = MetamathParsers.preprocess("D:\\Install\\metamath\\metamath\\set.mm");

        //then
        assertTrue(preprocessed.getCode().size() > 0);
        assertTrue(preprocessed.getComments().size() > 0);
    }

    @Test
    public void nonLabeledListStatement_shouldParseNonLabeledListStatement() {
        //when
        ListStatement statement = MetamathParsers.nonLabeledListStatement().parse(
                tokenStreamFromString("$v A B C $.")
        ).get();

        //then
        assertEquals(ListStatementType.VARIABLE, statement.getType());
        assertEquals(Arrays.asList("A","B","C"), statement.getSymbols());
    }

    @Test
    public void labeledListStatement_shouldParseLabeledListStatement() {
        //when
        ListStatement statement = MetamathParsers.labeledListStatement().parse(
                tokenStreamFromString("dummylink.1 $e |- ph $.")
        ).get();

        //then
        assertEquals("dummylink.1", statement.getLabel());
        assertEquals(ListStatementType.ESSENTIAL, statement.getType());
        assertEquals(Arrays.asList("|-","ph"), statement.getSymbols());
    }

    private TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }

}