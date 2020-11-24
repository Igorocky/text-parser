package org.igye.metamath;

import java.util.ArrayList;
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

    public List<ListStatement> getAllAssertions() {
        final ArrayList<ListStatement> result = new ArrayList<>();
        for (Statement statement : allStatements) {
            if (statement instanceof BlockStatement) {
                result.addAll(((BlockStatement) statement).findAssertions(null).values());
            } else {
                final ListStatement listStatement = (ListStatement) statement;
                if (listStatement.getType() == ListStatementType.AXIOM
                        || listStatement.getType() == ListStatementType.THEOREM) {
                    result.add(listStatement);
                }
            }
        }
        return result;
    }
}
