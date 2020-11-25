package org.igye.metamath;

public class ConstStackNode extends StackNode {
    private ListStatement statement;

    public ConstStackNode(ListStatement statement) {
        super(statement.getSymbols());
        this.statement = statement;
    }
}
