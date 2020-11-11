package org.igye.textparser;

public interface TokenStream<V,P> {
    Token<V,P> head();
    TokenStream<V,P> tail();
    boolean isEmpty();
    boolean isNotEmpty();
}
