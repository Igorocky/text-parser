package org.igye.metamath;

import java.util.List;
import java.util.Map;

public class MetamathDatabase {
    private final List<Statement> allStatements;
    private final Map<String,ListStatement> statementMap;

    public MetamathDatabase(List<Statement> allStatements, Map<String, ListStatement> statementMap) {
        this.allStatements = allStatements;
        this.statementMap = statementMap;
    }


    public ListStatement getStatement(String label) {
        return statementMap.get(label);
    }
}
