package org.igye.textparser;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Spliterator;
import java.util.Spliterators;
import java.util.function.BiFunction;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

public class Parsers {

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

    public static <S extends TokenStream,P> Parser<S, List, P> and(Parser<S, ?, P>... parsers) {
        return tokens -> {
            List<ParseResult> results = new ArrayList<>();
            ParseResult lastParseResult = null;
            for (Parser<S,?,P> parser : parsers) {
                lastParseResult = parser.parse(
                        (S) (lastParseResult == null ? tokens : lastParseResult.getRemainingTokens())
                );
                if (lastParseResult.isFailure()) {
                    return lastParseResult;
                }
                results.add(lastParseResult);
            }
            return (ParseResult<S, List, P>) ParseResult.success(
                    results.stream().map(ParseResult::getResult).map(Optional::get).collect(Collectors.toList()),
                    ((PositionRange) getPositionRange(results)),
                    lastParseResult.getRemainingTokens()
            );
        };
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(
            int min, String errorMsg, Parser<S,?,P> parser) {
        return rep(min, 0, errorMsg, parser);
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(Parser<S,?,P> parser) {
        return rep(0, 0, null, parser);
    }

    public static <P,S extends TokenStream> Parser<S, List, P> rep(
            int min, int max, String errorMsg, Parser<S,?,P> parser) {
        return tokens -> {
            List<ParseResult> results = new ArrayList<>();
            ParseResult parseResult = parser.parse((S) tokens);
            while (parseResult.isSuccess()) {
                results.add(parseResult);
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
                        ((PositionRange) getPositionRange(results)),
                        results.isEmpty() ? tokens : results.get(results.size() - 1).getRemainingTokens()
                );
            }
        };
    }

    public static <P, S extends TokenStream, R> Parser<S, R, P> rec(Supplier<Parser<S, R, P>> parserSupplier) {
        final Parser<S, R, P>[] parser = new Parser[1];
        return tokenks -> {
            if (parser[0] == null) {
                parser[0] = parserSupplier.get();
            }
            return parser[0].parse(tokenks);
        };
    }

    public static <P, S extends TokenStream, R> Parser<S, R, P> withName(String parserName, Parser<S, R, P> parser) {
        return tokens -> {
            final ParseResult<S, R, P> parseResult = parser.parse(tokens);
            if (parseResult.isSuccess()) {
                return parseResult;
            } else {
                return ParseResult.failure(
                        parserName + ": " + parseResult.getFailureReason(),
                        parseResult.getRemainingTokens()
                );
            }
        };
    }

    public static <P, S extends TokenStream, R> Parser<S, R, P> debug(String parserName, Parser<S, R, P> parser) {
        return tokens -> {
            final ParseResult<S, R, P> parseResult = parser.parse(tokens);
            final String context = " - " + parserName
                    + ":" + prefix(30, tokens)
                    + " ### Remaining:" + prefix(10, parseResult.getRemainingTokens());
            if (parseResult.isSuccess()) {
                final PositionRange<P> pos = parseResult.getPositionRange();
                System.out.println("success " + "[" + pos.getStart() + "|" + pos.getEnd() + "]" + context);
            } else {
                System.out.println("fail   " + context);
            }
            return parseResult;
        };
    }

    public static <P,S extends TokenStream, R> Parser<S, Optional<R>, P> opt(Parser<S, R, P> parser) {
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

    public static <P,S extends TokenStream> Parser<S, ?, P> success() {
        return tokens -> {
            if (tokens.isNotEmpty()) {
                return ParseResult.success(
                        Optional.empty(),
                        ((PositionRange) new PositionRange<>(tokens.head().position(), tokens.head().position())),
                        tokens
                );
            } else {
                return ParseResult.failure("End of token stream reached", tokens);
            }
        };
    }

    public static <T,P,S extends TokenStream, R> Parser<S, R, P> tokenSeq(
            Supplier<TokenAccumulator<T, R>> tokenAccumulatorConstructor) {
        return tokens -> {
            if (tokens.isEmpty()) {
                return ParseResult.failure("End of input.", tokens);
            }
            TokenAccumulator<T, R> tokenAccumulator = tokenAccumulatorConstructor.get();
            List<TokenStream<T, P>> processed = new ArrayList<>();
            TokenStream<T, P> remaining = tokens;
            int resultLength;
            do {
                processed.add(remaining);
                remaining = remaining.tail();
                resultLength = tokenAccumulator.accept(processed.get(processed.size()-1).head().value(), remaining.isEmpty());
            } while (remaining.isNotEmpty() && resultLength < 0);
            if (resultLength < 0) {
                return ParseResult.failure(tokenAccumulator.getParserName() + " failed to parse", tokens);
            } else if (resultLength == 0) {
                return ParseResult.failure(tokenAccumulator.getErrorMessage(), tokens);
            } else {
                final TokenStream<T, P> start = processed.get(0);
                final TokenStream<T, P> end = processed.get(resultLength - 1);
                return ParseResult.success(
                        tokenAccumulator.getResult(),
                        (PositionRange) new PositionRange<>(
                                start.head().position(),
                                end.head().position()
                        ),
                        end.tail()
                );
            }
        };
    }

    public static <C,T,R> Parser<TokenStream<Character, PositionInText>, R, PositionInText> tokenSeq(
            String parserName,
            Supplier<C> contextConstructor,
            TokenProcessor<C,T> processor,
            BiFunction<C,Integer,R> getResult,
            String errorMsg
    ) {
        return tokenSeq(() -> new TokenAccumulator<T, R>() {
            private C ctx = contextConstructor.get();
            private int resultLength;

            @Override
            public String getParserName() {
                return parserName;
            }

            @Override
            public int accept(T tokenValue, boolean isLast) {
                return (resultLength = processor.process(ctx, tokenValue, isLast));
            }

            @Override
            public R getResult() {
                return getResult.apply(ctx,resultLength);
            }

            @Override
            public String getErrorMessage() {
                return errorMsg;
            }
        });
    }

    public static <P, S extends TokenStream, R> Stream<ParseResult<S, R, P>> stream(
            Parser<S, R, P> parser, Supplier<S> stream) {
        return StreamSupport.stream(
                Spliterators.spliteratorUnknownSize(iterator(parser, stream), Spliterator.ORDERED),
                false
        );
    }

    public static <P,S extends TokenStream,R> Iterator<ParseResult<S, R, P>> iterator(
            Parser<S,R,P> parser, Supplier<S> streamSupplier) {
        return new Iterator<ParseResult<S, R, P>>() {
            private S remainingTokens;
            private ParseResult<S, R, P> lastResult;

            @Override
            public boolean hasNext() {
                if (remainingTokens == null) {
                    remainingTokens = streamSupplier.get();
                }
                if (remainingTokens.isEmpty()) {
                    return false;
                }
                if (lastResult == null) {
                    return true;
                }
                return lastResult.isSuccess();
            }

            @Override
            public ParseResult<S, R, P> next() {
                if (remainingTokens == null) {
                    remainingTokens = streamSupplier.get();
                }
                lastResult = parser.parse(remainingTokens);
                remainingTokens = lastResult.getRemainingTokens();
                return lastResult;
            }
        };
    }

    private static <P> PositionRange<P> getPositionRange(List<ParseResult> parseResults) {
        if (parseResults.isEmpty()) {
            return new PositionRange(null, null);
        }
        final int halfSize = parseResults.size() / 2;
        final int lastIdx = parseResults.size() - 1;
        P startPosition = null;
        P endPosition = null;
        for (int i = 0; i <= halfSize && (startPosition == null || endPosition == null); i++) {
            if (startPosition == null) {
                startPosition = (P) parseResults.get(i).getPositionRange().getStart();
            }
            if (endPosition == null) {
                endPosition = (P) parseResults.get(lastIdx - i).getPositionRange().getEnd();
            }
        }
        return new PositionRange(startPosition, endPosition);
    }

    private static String prefix(int length, TokenStream stream) {
        if (stream.isEmpty()) {
            return "[empty]";
        } else {
            final StringBuilder sb = new StringBuilder();
            sb.append("[" + stream.head().position().toString() + "]");
            while (stream.isNotEmpty() && length > 0) {
                sb.append(stream.head().value().toString());
                stream = stream.tail();
                length--;
            }
            return sb.toString();
        }
    }
}
