package org.igye.metamath;

import lombok.AllArgsConstructor;

import java.util.List;

@AllArgsConstructor
public class StackNode {
    protected List<String> expr;

    public List<String> getExpr() {
        return expr;
    }
}
