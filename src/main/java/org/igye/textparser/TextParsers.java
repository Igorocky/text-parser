package org.igye.textparser;

import lombok.val;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.opt;
import static org.igye.textparser.Parsers.rep;
import static org.igye.textparser.Parsers.success;

public class TextParsers {


    public static <S extends TokenStream,P> Parser<S, List, P> list(Parser elemParser) {
        return list(elemParser, null);
    }

    public static <S extends TokenStream,P> Parser<S, List, P> list(Parser elemParser, Parser sepParser) {
        Parser sep = spacePadded(sepParser == null ? success() : sepParser);
        Parser elem = spacePadded(elemParser);
        Parser<TokenStream, List, Object> listParser = and(opt(elem), rep(and(sep, elem)));
        return tokens -> {
            final ParseResult<TokenStream, List, Object> parseResult = listParser.parse(tokens);
            if (!((Optional<Object>) parseResult.get().get(0)).isPresent()) {
                return (ParseResult) parseResult.map(o -> Collections.emptyList());
            } else {
                List<Object> result = new ArrayList<>();
                final List andList = parseResult.get();
                result.add(((Optional<Object>) andList.get(0)).get());
                final List<List<Object>> repList = (List<List<Object>>) parseResult.get().get(1);
                for (List<Object> repAndList : repList) {
                    result.add(repAndList.get(1));
                }
                return (ParseResult) parseResult.map(o -> result);
            }
        };
    }

    public static <S extends TokenStream,R> Parser<S, R, PositionInText> spacePadded(Parser parser) {
        val optSpace = opt(space());
        val spacePaddedParser = and(optSpace, parser, optSpace);
        return tokens -> {
            val parseResult = spacePaddedParser.parse(tokens);
            if (parseResult.isFailure()) {
                return (ParseResult) parseResult;
            } else {
                return (ParseResult) parseResult.map(elems -> ((R) (((List) elems)).get(1)));
            }
        };
    }

    public static Parser<TokenStream<Character, PositionInText>,Integer,PositionInText> integer() {
        return tokens -> {
            TokenStream<Character, PositionInText> remaining = tokens;
            StringBuffer chars = new StringBuffer();
            Token<Character, PositionInText> lastToken = null;
            while (remaining.isNotEmpty() && Character.isDigit(remaining.head().value())) {
                lastToken = remaining.head();
                chars.append(lastToken.value());
                remaining = remaining.tail();
            }
            if (remaining == tokens) {
                return ParseResult.failure("A digit was expected", tokens);
            } else {
                return ParseResult.success(
                        Integer.parseInt(chars.toString()),
                        new PositionRange<>(tokens.head().position(), lastToken.position()),
                        remaining
                );
            }
        };
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> space() {
        return tokens -> {
            TokenStream<Character, PositionInText> remaining = tokens;
            StringBuffer chars = new StringBuffer();
            Token<Character, PositionInText> lastToken = null;
            while (remaining.isNotEmpty() && Character.isWhitespace(remaining.head().value())) {
                lastToken = remaining.head();
                chars.append(lastToken.value());
                remaining = remaining.tail();
            }
            if (remaining == tokens) {
                return ParseResult.failure("A whitespace was expected", tokens);
            } else {
                return ParseResult.success(
                        chars.toString(),
                        new PositionRange<>(tokens.head().position(), lastToken.position()),
                        remaining
                );
            }
        };
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> literal(String value) {
        return tokens -> {
            TokenStream<Character, PositionInText> remaining = tokens;
            int idx = -1;
            Token<Character, PositionInText> lastToken = null;
            while (remaining.isNotEmpty() && idx+1 < value.length() && remaining.head().value().equals(value.charAt(idx+1))) {
                lastToken = remaining.head();
                idx++;
                remaining = remaining.tail();
            }
            if (idx != value.length()-1) {
                return ParseResult.failure("'" + value + "' literal expected", tokens);
            } else {
                return ParseResult.success(
                        value,
                        new PositionRange<>(tokens.head().position(), lastToken.position()),
                        remaining
                );
            }
        };
    }
}
