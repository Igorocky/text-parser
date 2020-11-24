package org.igye.textparser;

import lombok.Value;

import java.util.Comparator;

@Value
public class PositionInText implements Comparable<PositionInText> {
    private static final Comparator<PositionInText> comparator = Comparator.comparing(PositionInText::getLine)
            .thenComparing(PositionInText::getCol);
    private int line;
    private int col;

    @Override
    public String toString() {
        return (line+1) + ":" + (col+1);
    }

    @Override
    public int compareTo(PositionInText o) {
        return comparator.compare(this, o);
    }
}
