package org.igye.metamath;

import org.igye.textparser.ParseResult;
import org.igye.textparser.Parser;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;
import org.junit.Test;

import static org.igye.metamath.TestUtils.tokenStreamFromString;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class TypesettingParsersTest {
    @Test
    public void quotedStringArg_parses_correctly() {
        //given
        final Parser<TokenStream<Character, PositionInText>, QuotedStringArg, PositionInText> parser =
                TypesettingParsers.quotedStringArg();
        ParseResult<TokenStream<Character, PositionInText>, QuotedStringArg, PositionInText> parseResult;

        //when/then
        parseResult = parser.parse(tokenStreamFromString("\"ab\" + \"cd\" +\n 'ef'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("abcdef", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getLine());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(1, parseResult.get().getEnd().getLine());
        assertEquals(4, parseResult.get().getEnd().getCol());
    }

    @Test
    public void quotedString_parses_correctly() {
        //given
        final Parser<TokenStream<Character, PositionInText>, QuotedString, PositionInText> parser =
                TypesettingParsers.quotedString('\'');
        ParseResult<TokenStream<Character, PositionInText>, QuotedString, PositionInText> parseResult;

        //when/then
        parseResult = parser.parse(tokenStreamFromString(""));
        assertTrue(parseResult.isFailure());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("abc"));
        assertTrue(parseResult.isFailure());
        assertEquals('a', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("abc'"));
        assertTrue(parseResult.isFailure());
        assertEquals('a', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'"));
        assertTrue(parseResult.isFailure());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'abc"));
        assertTrue(parseResult.isFailure());
        assertEquals('\'', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''c"));
        assertTrue(parseResult.isFailure());
        assertEquals('\'', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("''"));
        assertTrue(parseResult.isSuccess());
        assertEquals("", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(1, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'a'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("a", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(2, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("ab", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(3, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'a'."));
        assertTrue(parseResult.isSuccess());
        assertEquals("a", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(2, parseResult.get().getEnd().getCol());
        assertFalse(parseResult.getRemainingTokens().isEmpty());
        assertEquals('.', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'abc'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("abc", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(4, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'abc'."));
        assertTrue(parseResult.isSuccess());
        assertEquals("abc", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(4, parseResult.get().getEnd().getCol());
        assertFalse(parseResult.getRemainingTokens().isEmpty());
        assertEquals('.', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''c'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("ab'c", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(6, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''c'."));
        assertTrue(parseResult.isSuccess());
        assertEquals("ab'c", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(6, parseResult.get().getEnd().getCol());
        assertFalse(parseResult.getRemainingTokens().isEmpty());
        assertEquals('.', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''''c'"));
        assertTrue(parseResult.isSuccess());
        assertEquals("ab''c", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(8, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''''c'."));
        assertTrue(parseResult.isSuccess());
        assertEquals("ab''c", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(8, parseResult.get().getEnd().getCol());
        assertFalse(parseResult.getRemainingTokens().isEmpty());
        assertEquals('.', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''''"));
        assertTrue(parseResult.isFailure());
        assertEquals('\'', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'ab''''c"));
        assertTrue(parseResult.isFailure());
        assertEquals('\'', parseResult.getRemainingTokens().head().value().charValue());

        //when/then
        parseResult = parser.parse(tokenStreamFromString("'<SPAN CLASS=hidden STYLE=\"color:gray\">&#8866; </SPAN>';"));
        assertTrue(parseResult.isSuccess());
        assertEquals("<SPAN CLASS=hidden STYLE=\"color:gray\">&#8866; </SPAN>", parseResult.get().getText());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(54, parseResult.get().getEnd().getCol());
        assertFalse(parseResult.getRemainingTokens().isEmpty());
        assertEquals(';', parseResult.getRemainingTokens().head().value().charValue());
    }

}