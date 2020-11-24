package org.igye.metamath;

import java.util.Collections;
import java.util.List;

public class MetamathDatabase {
    private final List<Statement> allStatements;

    public MetamathDatabase(List<Statement> allStatements) {
        this.allStatements = allStatements;
    }

    public ListStatement getStatement(String label) {
        return Metamath.findActiveStatements(
                allStatements.get(allStatements.size()-1),
                Collections.singleton(label)
        ).get(label);
    }
}
