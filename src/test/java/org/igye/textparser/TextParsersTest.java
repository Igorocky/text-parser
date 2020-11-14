package org.igye.textparser;

import lombok.val;
import org.junit.Assert;
import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.igye.textparser.Parsers.or;
import static org.igye.textparser.TextParsers.integer;
import static org.igye.textparser.TextParsers.list;
import static org.igye.textparser.TextParsers.literal;
import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.opt;
import static org.igye.textparser.Parsers.rep;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class TextParsersTest {

    @Test
    public void integer_parsesIntegersInsideOfText() {
        //when
        val parseResult = TextParsers.integer().parse(
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
    public void integer_parsesIntegersAtTheEndOfText() {
        //when
        val parseResult = TextParsers.integer().parse(
                tokenStreamFromString("639")
        );

        //then
        Assert.assertEquals(639, parseResult.getResult().get().intValue());
        Assert.assertTrue(parseResult.getRemainingTokens().isEmpty());
        final PositionRange<PositionInText> positionRange = parseResult.getPositionRange();
        Assert.assertEquals(0, positionRange.getStart().getLine());
        Assert.assertEquals(0, positionRange.getStart().getCol());
        Assert.assertEquals(0, positionRange.getEnd().getLine());
        Assert.assertEquals(2, positionRange.getEnd().getCol());
    }

    @Test
    public void literal_parsesLiterals() {
        //when
        val parseResult = literal("define").parse(
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
    public void opt_parserCombinatorShouldWorkCorrectly() {
        //given
        val optComma = opt(literal(","));
        //when
        val parseResult = optComma.parse(tokenStreamFromString(",."));
        //then
        Assert.assertEquals(",", parseResult.get().get());
        //when
        val parseResult2 = optComma.parse(tokenStreamFromString(".,."));
        //then
        assertTrue(parseResult2.isSuccess());
        assertFalse(parseResult2.get().isPresent());
    }

    @Test
    public void parserCombinatorsShouldWorkCorrectly() {
        //given
        val integer = TextParsers.integer();
        val comma = literal(",");
        val arrElem = and(opt(comma), integer);
        val inpArgs = rep(arrElem);

        //when
        val parseResult = inpArgs.parse(
                tokenStreamFromString("93,57,17")
        );

        //then
        final List inputArgsParsed = parseResult.get();
        assertFalse(((Optional<String>)((List) inputArgsParsed.get(0)).get(0)).isPresent());
        assertEquals(93, ((Integer)((List) inputArgsParsed.get(0)).get(1)).intValue());
        assertEquals(",", ((Optional<String>)((List) inputArgsParsed.get(1)).get(0)).get());
        assertEquals(57, ((Integer)((List) inputArgsParsed.get(1)).get(1)).intValue());
        assertEquals(",", ((Optional<String>)((List) inputArgsParsed.get(2)).get(0)).get());
        assertEquals(17, ((Integer)((List) inputArgsParsed.get(2)).get(1)).intValue());

        assertEquals(0, parseResult.getPositionRange().getStart().getLine());
        assertEquals(0, parseResult.getPositionRange().getStart().getCol());
        assertEquals(0, parseResult.getPositionRange().getEnd().getLine());
        assertEquals(7, parseResult.getPositionRange().getEnd().getCol());
    }

    @Test
    public void list_shouldParseListsCorrectly_whenSeparatorIsSpecified() {
        //given
        val listParser = list(
                or(
                        integer(),
                        or(literal("a"), literal("b"), literal("c"))
                ),
                literal(",")
        );

        //then
        assertEquals(Collections.emptyList(), listParser.parse(tokenStreamFromString("")).get());
        assertEquals(Collections.emptyList(), listParser.parse(tokenStreamFromString("   ")).get());

        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("1004")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("1004    ")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("   1004")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("   1004   ")).get());

        assertEquals(Arrays.asList("c"), listParser.parse(tokenStreamFromString("c")).get());
        assertEquals(Arrays.asList("a"), listParser.parse(tokenStreamFromString("a    ")).get());
        assertEquals(Arrays.asList("b"), listParser.parse(tokenStreamFromString("   b")).get());
        assertEquals(Arrays.asList("a"), listParser.parse(tokenStreamFromString("   a   ")).get());

        assertEquals(Arrays.asList(93,57,17), listParser.parse(tokenStreamFromString("93,57,17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("93,b,17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("93, b, 17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("  93, b, 17 ")).get());
    }

    @Test
    public void list_shouldParseListsCorrectly_whenSeparatorIsNotSpecified() {
        //given
        val listParser = list(
                or(
                        integer(),
                        or(literal("a"), literal("b"), literal("c"))
                )
        );

        //then
        assertEquals(Collections.emptyList(), listParser.parse(tokenStreamFromString("")).get());
        assertEquals(Collections.emptyList(), listParser.parse(tokenStreamFromString("   ")).get());

        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("1004")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("1004    ")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("   1004")).get());
        assertEquals(Arrays.asList(1004), listParser.parse(tokenStreamFromString("   1004   ")).get());

        assertEquals(Arrays.asList("c"), listParser.parse(tokenStreamFromString("c")).get());
        assertEquals(Arrays.asList("a"), listParser.parse(tokenStreamFromString("a    ")).get());
        assertEquals(Arrays.asList("b"), listParser.parse(tokenStreamFromString("   b")).get());
        assertEquals(Arrays.asList("a"), listParser.parse(tokenStreamFromString("   a   ")).get());

        assertEquals(Arrays.asList(93,57,17), listParser.parse(tokenStreamFromString("93 57 17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("93 b 17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("93  b  17")).get());
        assertEquals(Arrays.asList(93,"b",17), listParser.parse(tokenStreamFromString("  93  b  17 ")).get());
    }

    private TokenStream<Character, PositionInText> tokenStreamFromString(String str) {
        return Parsers.inputStreamToTokenStream(new ByteArrayInputStream(str.getBytes()));
    }
}