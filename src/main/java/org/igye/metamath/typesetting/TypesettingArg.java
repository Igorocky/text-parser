package org.igye.metamath.typesetting;

import org.igye.textparser.PositionInText;

public interface TypesettingArg {
    PositionInText getBegin();
    PositionInText getEnd();
}
