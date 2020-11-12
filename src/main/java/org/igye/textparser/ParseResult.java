package org.igye.textparser;

import java.util.Optional;
import java.util.function.Function;

public class ParseResult<S extends TokenStream, R, P> {
    private Optional<R> result;
    private PositionRange<P> positionRange;
    private String failureReason;
    private S remainingTokens;

    private ParseResult(Optional<R> result, PositionRange<P> positionRange, String failureReason, S remainingTokens) {
        this.result = result;
        this.positionRange = positionRange;
        this.failureReason = failureReason;
        this.remainingTokens = remainingTokens;
    }

    public static <S extends TokenStream, R, P> ParseResult<S, R, P> success(
            R result, PositionRange<P> positionRange, S remainingTokens) {
        return new ParseResult<>(Optional.of(result), positionRange, null, remainingTokens);
    }

    public static <S extends TokenStream, R, P> ParseResult<S, R, P> failure(String failureReason, S remainingTokens) {
        return new ParseResult<>(Optional.empty(), null, failureReason, remainingTokens);
    }

    public <R2> ParseResult<S, R2, P> map(Function<R,R2> mapper) {
        return new ParseResult<>(result.map(mapper), positionRange, failureReason, remainingTokens);
    }

    public boolean isSuccess() {
        return result.isPresent();
    }

    public boolean isFailure() {
        return !isSuccess();
    }

    public Optional<R> getResult() {
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
