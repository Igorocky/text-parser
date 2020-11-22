package org.igye.metamath;

import org.igye.textparser.ParserException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

public class MetamathContext {
    private MetamathContext parent;
    private ListStatement listStatement;
    private Map<String,ListStatement> constants = new HashMap<>();
    private Map<String,ListStatement> variables = new HashMap<>();
    private Map<String,ListStatement> types = new HashMap<>();
    private List<ListStatement> hypotheses = null;

    public MetamathContext() {

    }

    private MetamathContext(MetamathContext parent, ListStatement listStatement) {
        this.parent = parent;
        this.listStatement = listStatement;
    }

    public MetamathContext createChildContext(ListStatement listStatement) {
        if (
                listStatement.getType() != ListStatementType.CONSTANT
                        && listStatement.getType() != ListStatementType.VARIABLE
                        && listStatement.getType() != ListStatementType.FLOATING
                        && listStatement.getType() != ListStatementType.ESSENTIAL
                        && listStatement.getType() != ListStatementType.DISJOINT
        ) {
            throw new ParserException("Unexpected statement type: " + listStatement.getType()
                    + " at " + listStatement.getBegin());
        }
        return new MetamathContext(this, listStatement);
    }

    public List<ListStatement> getAllHypotheses() {
        if (hypotheses != null) {
            return hypotheses;
        } else {
            if (parent != null) {
                List<ListStatement> parentHypotheses = parent.getAllHypotheses();
                if (!parentHypotheses.isEmpty()) {
                    hypotheses = new ArrayList<>(parentHypotheses);
                }
            }
            if (listStatement != null && listStatement.getType() == ListStatementType.ESSENTIAL) {
                if (hypotheses == null) {
                    hypotheses = Collections.singletonList(listStatement);
                } else {
                    hypotheses.add(listStatement);
                }
            }
            if (hypotheses == null) {
                hypotheses = Collections.emptyList();
            }
            return hypotheses;
        }
    }

    public ListStatement getConstant(String symbol) {
        return getStatement(
                symbol, constants, ListStatementType.CONSTANT, metamathContext -> metamathContext.getConstant(symbol)
        );
    }

    public ListStatement getVariable(String symbol) {
        return getStatement(
                symbol, variables, ListStatementType.VARIABLE, metamathContext -> metamathContext.getVariable(symbol)
        );
    }

    public ListStatement getType(String varName) {
        return getStatement(
                varName, types, ListStatementType.FLOATING, metamathContext -> metamathContext.getType(varName)
        );
    }

    private ListStatement getStatement(
            String symbol,
            Map<String,ListStatement> cache,
            ListStatementType type,
            Function<MetamathContext,ListStatement> getter) {
        if (cache.containsKey(symbol)) {
            return cache.get(symbol);
        } else {
            if (
                    listStatement != null && listStatement.getType() == type
                    && (
                            type == ListStatementType.FLOATING && symbol.equals(listStatement.getSymbols().get(1))
                                    || type != ListStatementType.FLOATING && listStatement.getSymbols().contains(symbol)
                    )
            ) {
                cache.put(symbol, listStatement);
                return listStatement;
            } else if (parent != null) {
                final ListStatement parentConst = getter.apply(parent);
                if (parentConst != null) {
                    cache.put(symbol, parentConst);
                    return parentConst;
                } else {
                    return null;
                }
            } else {
                return null;
            }
        }
    }
}
