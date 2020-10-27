package org.igye.textparser;

import java.util.function.Supplier;

public class SimpleTokenStreamImpl<T> implements TokenStream<T> {
    private final Supplier<Token<T>[]> generator;
    private final Token<T>[] elems;
    private final int idx;
    private TokenStream<T> tail;

    public SimpleTokenStreamImpl(Supplier<Token<T>[]> generator) {
        this(generator, generator.get(), 0);
    }

    private SimpleTokenStreamImpl(Supplier<Token<T>[]> generator, Token<T>[] elems, int idx) {
        this.generator = generator;
        this.elems = elems;
        this.idx = idx;
    }

    @Override
    public Token<T> head() {
        if (idx < elems.length) {
            return elems[idx];
        } else {
            throw new ParserException("Cannot determine current Token.");
        }
    }

    @Override
    public TokenStream<T> tail() {
        if (tail != null) {
            return tail;
        } else {

        }
        if (idx < elems.length-1) {
            return new SimpleTokenStreamImpl()
        }
    }

    @Override
    public boolean isEmpty() {
        return false;
    }

    @Override
    public boolean isNotEmpty() {
        return false;
    }
}
