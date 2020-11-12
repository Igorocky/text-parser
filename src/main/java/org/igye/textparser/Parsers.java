package org.igye.textparser;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class Parsers {

    @lombok.SneakyThrows
    public static TokenStream<Character, PositionInText> inputStreamToTokenStream(InputStream inputStream) {
        return new SimpleTokenStreamImpl<>(new InputStreamTokenGenerator(inputStream));
    }

    public static <P,S extends TokenStream> Parser<S, ?, P> or(Parser<S,?,P>... parsers) {
        return tokens -> {
            ParseResult result = null;
            for (Parser parser : parsers) {
                result = parser.parse(tokens);
                if (result.isSuccess()) {
                    break;
                }
            }
            return result;
        };
    }

    public static <P,S extends TokenStream> Parser<S, List, P> and(Parser<S,?,P>... parsers) {
        return tokens -> {
            List<ParseResult> results = new ArrayList<>();
            P endPosition = null;
            for (Parser<S,?,P> parser : parsers) {
                ParseResult parseResult = parser.parse((S) tokens);
                if (parseResult.isFailure()) {
                    return parseResult;
                }
                results.add(parseResult);
                endPosition = (P) parseResult.getPositionRange().getEnd();
            }
            return (ParseResult<S, List, P>) ParseResult.success(
                    results.stream().map(ParseResult::getResult).map(Optional::get).collect(Collectors.toList()),
                    new PositionRange(tokens.head().position(), endPosition),
                    results.get(results.size()-1).getRemainingTokens()
            );
        };
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(
            int min, String errorMsg, Parser<S,?,P> parser) {
        return rep(min, 0, errorMsg, parser);
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(
            String errorMsg, Parser<S,?,P> parser) {
        return rep(0, 0, errorMsg, parser);
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(
            int min, int max, String errorMsg, Parser<S,?,P> parser) {
        return tokens -> {
            List<ParseResult> results = new ArrayList<>();
            P endPosition = null;
            ParseResult parseResult = parser.parse((S) tokens);
            while (parseResult.isSuccess()) {
                results.add(parseResult);
                endPosition = (P) parseResult.getPositionRange().getEnd();
                parseResult = parser.parse((S) parseResult.getRemainingTokens());
            }
            if (results.size() < min) {
                return ParseResult.failure(
                        errorMsg + ": minimum number of occurrences expected " + min + " but got " + results.size(),
                        tokens
                );
            } else if (max > 0 && max < results.size()) {
                return ParseResult.failure(
                        errorMsg + ": maximum number of occurrences expected " + max + " but got " + results.size(),
                        tokens
                );
            } else {
                return (ParseResult<S, List, P>) ParseResult.success(
                        results.stream().map(ParseResult::getResult).map(Optional::get).collect(Collectors.toList()),
                        new PositionRange(tokens.head().position(), endPosition),
                        results.get(results.size() - 1).getRemainingTokens()
                );
            }
        };
    }

    public static <V,P,S extends TokenStream, R> Parser<S, Optional<R>, P> opt(Parser<S, R, P> parser) {
        return tokens -> {
            final ParseResult<S, R, P> parseResult = parser.parse((S) tokens);
            if (parseResult.isFailure()) {
                return ParseResult.success(
                        Optional.empty(),
                        new PositionRange<>(null, null),
                        tokens
                );
            } else {
                return parseResult.map(res -> Optional.of(res));
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
