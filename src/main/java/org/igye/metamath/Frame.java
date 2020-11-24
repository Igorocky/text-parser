package org.igye.metamath;

import lombok.Data;

import java.util.List;

@Data
public class Frame {
    private List<ListStatement> types;
    private List<ListStatement> hypotheses;
    private ListStatement assertion;
    private int arity = -1;

    public int getArity() {
        if (arity < 0) {
            arity = types.size() + hypotheses.size();
        }
        return arity;
    }
}
