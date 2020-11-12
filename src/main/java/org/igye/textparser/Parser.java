package org.igye.textparser;

public interface Parser<S extends TokenStream, R, P> {
    ParseResult<S, R, P> parse(S input);
}
