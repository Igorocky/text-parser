package org.igye.metamath;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProofStack {
    private int nodeId = 1;
    private List<StackNode> stack = new ArrayList<>();

    public int size() {
        return stack.size();
    }

    public List<StackNode> removeLast(int amount) {
        final List<StackNode> result = new ArrayList<>();
        for (int i = 0; i < amount; i++) {
            result.add(stack.remove(stack.size()-1));
        }
        Collections.reverse(result);
        return result;
    }

    public void add(StackNode node) {
        stack.add(node);
        if (node.getId() == -1) {
            node.setId(nodeId++);
        }
    }

    public StackNode get(int i) {
        return stack.get(i);
    }
}
