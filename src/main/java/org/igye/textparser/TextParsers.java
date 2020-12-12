package org.igye.textparser;

import lombok.SneakyThrows;
import lombok.val;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Function;
import java.util.function.Supplier;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.opt;
import static org.igye.textparser.Parsers.rep;
import static org.igye.textparser.Parsers.success;
import static org.igye.textparser.Parsers.tokenSeq;

public class TextParsers {
    @SneakyThrows
    public static TokenStream<Character, PositionInText> fileToTokenStream(String filePath) {
        return new SimpleTokenStreamImpl<>(new InputStreamTokenGenerator(new FileInputStream(new File(filePath))));
    }

    @SneakyThrows
    public static TokenStream<Character, PositionInText> fileToTokenStream(File file) {
        return new SimpleTokenStreamImpl<>(new InputStreamTokenGenerator(new FileInputStream(file)));
    }

    @SneakyThrows
    public static TokenStream<Character, PositionInText> inputStreamToTokenStream(InputStream inputStream) {
        return new SimpleTokenStreamImpl<>(new InputStreamTokenGenerator(inputStream));
    }

    public static <S extends TokenStream,P> Parser<S, List, P> list(Parser elemParser) {
        return list(elemParser, null);
    }

    public static <S extends TokenStream,P> Parser<S, List, P> nonEmptyList(Parser elemParser, Parser sepParser) {
        Parser<TokenStream, List, Object> listParser = list(elemParser, sepParser);
        return tokens -> {
            final ParseResult<TokenStream, List, Object> parseResult = listParser.parse(tokens);
            if (parseResult.get().isEmpty()) {
                return ParseResult.failure("Non empty list was expected", tokens);
            } else {
                return (ParseResult<S, List, P>) parseResult;
            }
        };
    }

    public static <S extends TokenStream,P> Parser<S, List, P> list(Parser elemParser, Parser sepParser) {
        Parser sep = spacePadded(sepParser == null ? success() : sepParser);
        Parser elem = spacePadded(elemParser);
        Parser<TokenStream, List, Object> listParser = and(opt(space()),opt(elem), rep(and(sep, elem)));
        return tokens -> {
            final ParseResult<TokenStream, List, Object> parseResult = listParser.parse(tokens);
            final List andList = parseResult.get();
            if (!((Optional<Object>) andList.get(1)).isPresent()) {
                return (ParseResult) parseResult.map(o -> Collections.emptyList());
            } else {
                List<Object> result = new ArrayList<>();
                result.add(((Optional<Object>) andList.get(1)).get());
                final List<List<Object>> repList = (List<List<Object>>) andList.get(2);
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

    public static Parser<TokenStream<Character, PositionInText>, Integer, PositionInText> integer() {
        return charSeq(
                "Integer",
                Character::isDigit,
                sb -> Integer.parseInt(sb.toString()),
                "A digit was expected"
        );
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> space() {
        return charSeq(
                "Whitespace",
                Character::isWhitespace,
                sb -> sb.toString(),
                "A whitespace was expected"
        );
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> nonSpace() {
        return nonSpace(Collections.emptySet());
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> nonSpace(String exclusion) {
        return nonSpace(Collections.singleton(exclusion));
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> nonSpace(Set<String> exclusions) {
        return charSeq(
                "Non-whitespace",
                () -> new StringBuilder(),
                (sb,ch,last) -> {
                    if (!Character.isWhitespace(ch)) {
                        sb.append(ch);
                        return -1;
                    } else if (sb.length() == 0) {
                        return 0;
                    } else {
                        String str = sb.toString();
                        if (exclusions.contains(str)) {
                            return 0;
                        } else {
                            return str.length();
                        }
                    }
                },
                (sb,len) -> sb.toString(),
                "A non-whitespace was expected"
        );
    }

    public static Parser<TokenStream<Character, PositionInText>,String,PositionInText> literal(String value) {
        return charSeq(() -> new TokenAccumulator<Character, String>() {
            private int charsRead = 0;

            @Override
            public String getParserName() {
                return "Literal '" + value + "'";
            }

            @Override
            public int accept(Character ch, boolean isLast) {
                if (ch.equals(value.charAt(charsRead))) {
                    charsRead++;
                } else {
                    return 0;
                }
                return charsRead == value.length() ? charsRead : -1;
            }

            @Override
            public String getResult() {
                return value;
            }

            @Override
            public String getErrorMessage() {
                return "'" + value + "' literal expected";
            }
        });
    }

    public static <S extends TokenStream, R> Parser<S, R, PositionInText> charSeq(
            Supplier<TokenAccumulator<Character, R>> tokenAccumulatorConstructor) {
        return tokenSeq(tokenAccumulatorConstructor);
    }

    public static <R> Parser<TokenStream<Character, PositionInText>, R, PositionInText> charSeq(
            String parserName,
            Function<Character,Boolean> decide,
            Function<StringBuilder,R> getResult,
            String errorMsg
    ) {
        return charSeq(
                parserName,
                () -> new StringBuilder(),
                (sb,ch,isLast) -> {
                    boolean finished = false;
                    if (decide.apply(ch)) {
                        sb.append(ch);
                    } else {
                        finished = true;
                    }
                    return (isLast || finished) ? sb.length() : -1;
                },
                (sb,len) -> getResult.apply(sb),
                errorMsg
        );
    }

    public static <R,C> Parser<TokenStream<Character, PositionInText>, R, PositionInText> charSeq(
            String parserName,
            Supplier<C> contextConstructor,
            CharProcessor<C> processor,
            BiFunction<C,Integer,R> getResult,
            String errorMsg
    ) {
        return tokenSeq(parserName, contextConstructor, processor, getResult, errorMsg);
    }
}
