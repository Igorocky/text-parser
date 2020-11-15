package org.igye.textparser;

import lombok.Value;

@Value
public class PositionInText {
    private int line;
    private int col;

    @Override
    public String toString() {
        return (line+1) + ":" + (col+1);
    }
}
