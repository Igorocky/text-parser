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
}
