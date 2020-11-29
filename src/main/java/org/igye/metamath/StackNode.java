package org.igye.metamath;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

public class StackNode {
    @Getter
    @Setter
    protected int id = -1;
    protected List<String> expr;

    public StackNode(List<String> expr) {
        this.expr = expr;
    }

    public List<String> getExpr() {
        return expr;
    }
}
