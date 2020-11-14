package org.igye.textparser;

public interface TokenProcessor<C,T> {
    int process(C ctx, T tokenValue, boolean isLast);
}
