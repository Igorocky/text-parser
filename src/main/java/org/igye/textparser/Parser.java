package org.igye.textparser;

import java.util.function.BiFunction;
import java.util.function.Function;

public interface Parser<S extends TokenStream, R, P> {
    ParseResult<S, R, P> parse(S input);

    default <R2> Parser<S, R2, P> map(Function<R,R2> mapper) {
        return tokens -> parse(tokens).map(mapper);
    }

    default <R2> Parser<S, R2, P> map(BiFunction<R, PositionRange<P>, R2> mapper) {
        return tokens -> parse(tokens).map(mapper);
    }
}
