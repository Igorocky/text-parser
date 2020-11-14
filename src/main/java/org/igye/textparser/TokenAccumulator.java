package org.igye.textparser;

public interface TokenAccumulator<T,R> {
    String getParserName();
    int accept(T token, boolean isLast);
    R getResult();
    String getErrorMessage();
}
