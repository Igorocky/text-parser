package org.igye.metamath;

import org.igye.textparser.ParserException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MetamathContext {
    private MetamathContext parent;
    private ListStatement listStatement;
    private List<ListStatement> hypotheses = null;
    private SymbolsInfo symbolsInfo;

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

    public SymbolsInfo getSymbolsInfo() {
        if (symbolsInfo == null) {
            symbolsInfo = new SymbolsInfo();
            collectSymbolsInfo(symbolsInfo);
        }
        return symbolsInfo;
    }

    private void collectSymbolsInfo(SymbolsInfo symbolsInfo) {
        if (listStatement != null) {
            final List<String> symbols = listStatement.getSymbols();
            if (listStatement.getType() == ListStatementType.CONSTANT) {
                if (symbols.stream().anyMatch(symbolsInfo.getConstants()::contains)) {
                    throw new MetamathException("A constant was redefined.");
                }
                symbolsInfo.getConstants().addAll(symbols);
            } else if (listStatement.getType() == ListStatementType.FLOATING) {
                if (symbolsInfo.getVarTypes().containsKey(symbols.get(1))) {
                    throw new MetamathException("A variable type was redefined.");
                }
                symbolsInfo.getVarTypes().put(symbols.get(1), listStatement);
            }
        }
        if (parent != null) {
            parent.collectSymbolsInfo(symbolsInfo);
        }
    }

}
