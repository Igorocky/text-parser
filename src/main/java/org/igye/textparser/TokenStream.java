package org.igye.textparser;

public interface TokenStream<T> {
    Token<T> head();
    TokenStream<T> tail();
    boolean isEmpty();
    boolean isNotEmpty();
}
