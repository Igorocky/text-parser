package org.igye.textparser;

public interface Token<T> {
    T value();
    Position position();
}
