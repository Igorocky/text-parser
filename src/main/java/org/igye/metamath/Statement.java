package org.igye.metamath;

import org.igye.textparser.PositionInText;

public interface Statement {
    PositionInText getBegin();
    PositionInText getEnd();
}
