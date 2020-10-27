package org.igye.textparser;

import org.apache.commons.lang3.tuple.Pair;

public interface Parser<T,O> {
    Pair<O, TokenStream<T>> parse(TokenStream<T> input);
}
