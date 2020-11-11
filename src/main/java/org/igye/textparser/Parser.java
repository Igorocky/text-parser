package org.igye.textparser;

public interface Parser<S extends TokenStream,O,P> {
    ParseResult<S,O,P> parse(S input);
}
