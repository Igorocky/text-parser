package org.igye.textparser;

import java.io.InputStream;

public class Parsers {

    @lombok.SneakyThrows
    public static TokenStream<Character, PositionInText> inputStreamToTokenStream(InputStream inputStream) {
        return new SimpleTokenStreamImpl<>(new InputStreamTokenGenerator(inputStream));
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
