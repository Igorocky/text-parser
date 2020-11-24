package org.igye.metamath;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.igye.textparser.PositionInText;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BlockStatement implements Statement {
    private PositionInText begin;
    private PositionInText end;
    private Statement prevStatement;
    private BlockStatement currBlock;
    private List<Statement> content;

    public Map<String,ListStatement> findAssertions(Set<String> labels) {
        final HashMap<String, ListStatement> result = new HashMap<>();
        for (Statement statement : content) {
            if (statement instanceof BlockStatement) {
                result.putAll(((BlockStatement) statement).findAssertions(labels));
            } else {
                final ListStatement listStatement = (ListStatement) statement;
                if (
                        (
                                listStatement.getType() == ListStatementType.AXIOM
                                        || listStatement.getType() == ListStatementType.THEOREM
                        ) && (
                                        labels == null || labels.contains(listStatement.getLabel())
                        )
                ) {
                    result.put(listStatement.getLabel(), listStatement);
                }
            }
        }
        return result;
    }
}
