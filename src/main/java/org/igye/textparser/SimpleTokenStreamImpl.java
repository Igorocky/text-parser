package org.igye.textparser;

import java.util.function.Supplier;

public class SimpleTokenStreamImpl<T,P> implements TokenStream<T,P> {
    private final Supplier<Token<T,P>[]> generator;
    private final Token<T,P>[] elems;
    private final int idx;
    private TokenStream<T,P> tail;

    public SimpleTokenStreamImpl(Supplier<Token<T,P>[]> generator) {
        this(generator, generator.get(), 0);
    }

    private SimpleTokenStreamImpl(Supplier<Token<T,P>[]> generator, Token<T,P>[] elems, int idx) {
        this.generator = generator;
        this.elems = elems;
        this.idx = idx;
    }

    @Override
    public Token<T,P> head() {
        if (idx < elems.length) {
            return elems[idx];
        } else {
            throw new ParserException("Cannot determine current Token.");
        }
    }

    @Override
    public TokenStream<T,P> tail() {
        if (isEmpty()) {
            return this;
        } else {
            if (tail == null) {
                if (idx < elems.length-1) {
                    tail = new SimpleTokenStreamImpl(generator, elems, idx + 1);
                } else {
                    tail = new SimpleTokenStreamImpl(generator, generator.get(), 0);
                }
            }
            return tail;
        }
    }

    @Override
    public boolean isEmpty() {
        return elems == null || elems.length == 0;
    }

    @Override
    public boolean isNotEmpty() {
        return !isEmpty();
    }
}
