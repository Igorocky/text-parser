package org.igye.textparser;

public interface TokenStream<T,P> {
    Token<T,P> head();
    TokenStream<T,P> tail();
    boolean isEmpty();
    boolean isNotEmpty();
}
