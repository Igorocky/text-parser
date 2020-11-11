package org.igye.textparser;

import java.util.function.Supplier;

public class SimpleTokenStreamImpl<V,P> implements TokenStream<V,P> {
    private final Supplier<Token<V,P>[]> generator;
    private final Token<V,P>[] elems;
    private final int idx;
    private TokenStream<V,P> tail;

    public SimpleTokenStreamImpl(Supplier<Token<V,P>[]> generator) {
        this(generator, generator.get(), 0);
    }

    private SimpleTokenStreamImpl(Supplier<Token<V,P>[]> generator, Token<V,P>[] elems, int idx) {
        this.generator = generator;
        this.elems = elems;
        this.idx = idx;
    }

    @Override
    public Token<V,P> head() {
        if (idx < elems.length) {
            return elems[idx];
        } else {
            throw new ParserException("Cannot determine current Token.");
        }
    }

    @Override
    public TokenStream<V,P> tail() {
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
