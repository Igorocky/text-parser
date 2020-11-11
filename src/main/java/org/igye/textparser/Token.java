package org.igye.textparser;

public interface Token<V, P> {
    V value();
    P position();
}
