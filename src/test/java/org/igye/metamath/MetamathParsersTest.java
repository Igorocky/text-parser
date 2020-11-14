package org.igye.metamath;

import org.igye.textparser.ParseResult;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TextParsers;
import org.igye.textparser.TokenStream;
import org.junit.Assert;
import org.junit.Test;

public class MetamathParsersTest {
    @Test
    public void preprocessed_shouldParseMetamathFile() {
        //given
        String pathToFile = "D:\\Install\\metamath\\metamath\\set.mm";

        //when
        final ParseResult<TokenStream<Character, PositionInText>, Preprocessed, PositionInText> parseResult =
                MetamathParsers.preprocessed().parse(TextParsers.fileToTokenStream(pathToFile));

        //then
        Assert.assertTrue(parseResult.get().getCode().size() > 0);
        Assert.assertTrue(parseResult.get().getComments().size() > 0);
    }

}