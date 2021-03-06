package org.igye.metamath.typesetting;

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
    public void typesettingDefinition_parses_correctly() {
        //given
        final Parser<TokenStream<Character, PositionInText>, TypesettingDefinition, PositionInText> parser =
                TypesettingParsers.typesettingDefinition();
        ParseResult<TokenStream<Character, PositionInText>, TypesettingDefinition, PositionInText> parseResult;

        //when
        parseResult = parser.parse(tokenStreamFromString("htmldef \"la\" as\n" +
                "    \"<IMG SRC='_lambda.gif' WIDTH=9 HEIGHT=19 ALT=' la' TITLE='la'>\";\n" +
                "  althtmldef \"la\" as\n" +
                "    '<SPAN CLASS=wff STYLE=\"color:blue\">&#x1D706;</SPAN>';\n" +
                "  latexdef \"la\" as \"\\lambda\";\n"));

        //then
        assertTrue(parseResult.isSuccess());
        assertEquals("htmldef", parseResult.get().getType());
        assertEquals(3, parseResult.get().getArgs().size());
        assertEquals("la", ((TypesettingData) parseResult.get().getArgs().get(0)).getText());
        assertEquals("as", ((TypesettingKeyword) parseResult.get().getArgs().get(1)).getText());
        assertEquals(
                "<IMG SRC='_lambda.gif' WIDTH=9 HEIGHT=19 ALT=' la' TITLE='la'>",
                ((TypesettingData) parseResult.get().getArgs().get(2)).getText()
        );
        assertEquals(0, parseResult.get().getBegin().getLine());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(2, parseResult.get().getEnd().getLine());
        assertEquals(1, parseResult.get().getEnd().getCol());
        assertEquals('a', parseResult.getRemainingTokens().head().value().charValue());
    }

    @Test
    public void typesettingDefinition_parses_correctly2() {
        //given
        final Parser<TokenStream<Character, PositionInText>, TypesettingDefinition, PositionInText> parser =
                TypesettingParsers.typesettingDefinition();
        ParseResult<TokenStream<Character, PositionInText>, TypesettingDefinition, PositionInText> parseResult;

        //when
        parseResult = parser.parse(tokenStreamFromString("htmlcss '<STYLE TYPE=\"text/css\">\\n' +\n" +
                "    '<!--\\n' +\n" +
                "    '  .setvar { color: red; }\\n' +\n" +
                "    '  .wff { color: blue; }\\n' +\n" +
                "    '  .class { color: #C3C; }\\n' +\n" +
                "    '  .symvar { border-bottom:1px dotted;color:#C3C}\\n' +\n" +
                "    '  .typecode { color: gray }\\n' +\n" +
                "    '  .hidden { color: gray }\\n' +\n" +
                "    '  @font-face {\\n' +\n" +
                "    '    font-family: XITSMath-Regular;\\n' +\n" +
                "    '    src: url(xits-math.woff);\\n' +\n" +
                "    '  }\\n' +\n" +
                "    '  .math { font-family: XITSMath-Regular }\\n' +\n" +
                "    '-->\\n' +\n" +
                "    '</STYLE>\\n' +\n" +
                "    '<LINK href=\"mmset.css\" title=\"mmset\"\\n' +\n" +
                "    '    rel=\"stylesheet\" type=\"text/css\">\\n' +\n" +
                "    '<LINK href=\"mmsetalt.css\" title=\"mmsetalt\"\\n' +\n" +
                "    '    rel=\"alternate stylesheet\" type=\"text/css\">';"));

        //then
        assertTrue(parseResult.isSuccess());
        assertEquals("htmlcss", parseResult.get().getType());
        assertEquals(1, parseResult.get().getArgs().size());
        assertEquals("<STYLE TYPE=\"text/css\">\\n<!--\\n  .setvar { color: red; }\\n  .wff { color: blue; }\\n  .class { color: #C3C; }\\n  .symvar { border-bottom:1px dotted;color:#C3C}\\n  .typecode { color: gray }\\n  .hidden { color: gray }\\n  @font-face {\\n    font-family: XITSMath-Regular;\\n    src: url(xits-math.woff);\\n  }\\n  .math { font-family: XITSMath-Regular }\\n-->\\n</STYLE>\\n<LINK href=\"mmset.css\" title=\"mmset\"\\n    rel=\"stylesheet\" type=\"text/css\">\\n<LINK href=\"mmsetalt.css\" title=\"mmsetalt\"\\n    rel=\"alternate stylesheet\" type=\"text/css\">", ((TypesettingData) parseResult.get().getArgs().get(0)).getText());
        assertEquals(0, parseResult.get().getBegin().getLine());
        assertEquals(0, parseResult.get().getBegin().getCol());
        assertEquals(18, parseResult.get().getEnd().getLine());
        assertEquals(53, parseResult.get().getEnd().getCol());
        assertTrue(parseResult.getRemainingTokens().isEmpty());
    }

    @Test
    public void quotedStringArg_parses_correctly() {
        //given
        final Parser<TokenStream<Character, PositionInText>, TypesettingData, PositionInText> parser =
                TypesettingParsers.typesettingData();
        ParseResult<TokenStream<Character, PositionInText>, TypesettingData, PositionInText> parseResult;

        //when
        parseResult = parser.parse(tokenStreamFromString("\"ab\" + \"cd\" +\n 'ef'"));

        //then
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