package org.igye.metamath;

import org.igye.textparser.PositionInText;

import java.util.Map;
import java.util.Set;

public interface Statement {
    PositionInText getBegin();
    PositionInText getEnd();
    Statement getPrevStatement();
    BlockStatement getCurrBlock();
    String getDescription();

    default Map<String,ListStatement> findActiveStatements(Set<String> labels) {
        return MetamathTools.findActiveStatements(MetamathTools.determinePrevStatement(this),labels);
    }
}
