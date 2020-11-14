package org.igye.textparser;

public interface Token<T, P> {
    T value();
    P position();
}
