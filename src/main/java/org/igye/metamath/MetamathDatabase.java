package org.igye.metamath;

import org.igye.metamath.typesetting.TypesettingDefinition;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MetamathDatabase {
    private final List<Statement> allStatements;
    private final List<TypesettingDefinition> typesetting;

    public MetamathDatabase(List<Statement> allStatements, List<TypesettingDefinition> typesetting) {
        this.allStatements = allStatements;
        this.typesetting = typesetting;
    }

    public ListStatement getStatement(String label) {
        return MetamathTools.findActiveStatements(
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

    public List<TypesettingDefinition> getTypesetting() {
        return typesetting;
    }
}
