package org.igye.metamath;

import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.Map;

@Getter
public class RuleStackNode extends StackNode {
    private List<StackNode> args;
    private ListStatement assertion;
    private Map<String,List<String>> substitution;

    @Builder
    public RuleStackNode(
            List<StackNode> args, ListStatement assertion, Map<String, List<String>> substitution, List<String> expr) {
        super(expr);
        this.args = args;
        this.assertion = assertion;
        this.substitution = substitution;
    }
}
