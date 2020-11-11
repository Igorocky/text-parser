package org.igye.textparser;

import java.util.Optional;

public class ParseResult<S extends TokenStream,O,P> {
    private Optional<O> result;
    private PositionRange<P> positionRange;
    private String failureReason;
    private S remainingTokens;

    private ParseResult(Optional<O> result, PositionRange<P> positionRange, String failureReason, S remainingTokens) {
        this.result = result;
        this.positionRange = positionRange;
        this.failureReason = failureReason;
        this.remainingTokens = remainingTokens;
    }

    public static <S extends TokenStream,O,P> ParseResult<S,O,P> success(
            O result, PositionRange<P> positionRange, S remainingTokens) {
        return new ParseResult<>(Optional.of(result), positionRange, null, remainingTokens);
    }

    public static <S extends TokenStream,O,P> ParseResult<S,O,P> failure(String failureReason, S remainingTokens) {
        return new ParseResult<>(Optional.empty(), null, failureReason, remainingTokens);
    }

    public Optional<O> getResult() {
        return result;
    }

    public PositionRange<P> getPositionRange() {
        return positionRange;
    }

    public S getRemainingTokens() {
        return remainingTokens;
    }

    public String getFailureReason() {
        return failureReason;
    }
}
