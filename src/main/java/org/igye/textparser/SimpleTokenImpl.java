package org.igye.textparser;

public class SimpleTokenImpl<T> implements Token<T> {
    private final T val;

    public SimpleTokenImpl(T val) {
        this.val = val;
    }

    public T value() {
        return val;
    }
}
