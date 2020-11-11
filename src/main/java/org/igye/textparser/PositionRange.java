package org.igye.textparser;

import lombok.Value;

@Value
public class PositionRange<P> {
    private P start;
    private P end;
}
