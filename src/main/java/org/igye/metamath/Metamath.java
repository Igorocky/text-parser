package org.igye.metamath;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Metamath {


    public static String stringify(ListStatement statement) {
        return StringUtils.join(statement.getSymbols(), ' ');
    }

    public static String stringify(Collection<ListStatement> statements) {
        return "["
                + statements.stream().map(Metamath::stringify).collect(Collectors.joining(", "))
                + "]";
    }

    public static String stringify(Frame frame) {
        return "["
                + stringify(frame.getTypes())
                + ", " + stringify(frame.getHypotheses())
                + ", " + stringify(frame.getAssertion())
                + "]";
    }

    public static void verifyProof(ListStatement theorem, MetamathDatabase database) {
        List<List<String>> stack = new ArrayList<>();
        eval(
                stack,
                theorem.getProof().stream().map(database::getStatement).collect(Collectors.toList())
        );
        if (stack.size() != 1) {
            throw new MetamathException("stack.size() != 1");
        }
        if (!stack.get(0).equals(theorem.getSymbols())) {
            throw new MetamathException("!stack.get(0).equals(theorem.getSymbols())");
        }
    }

    private static void eval(List<List<String>> stack, List<ListStatement> statements) {
        for (ListStatement statement : statements) {
            if (statement.getType() == ListStatementType.FLOATING) {
                stack.add(statement.getSymbols());
            } else {
                apply(stack, statement.getFrame());
            }
        }
    }

    private static void apply(List<List<String>> stack, Frame frame) {
        if (stack.size() < frame.getArity()) {
            throw new MetamathException("stack.size() < frame.getTypes().size() + frame.getHypothesis().size()");
        }
        final Map<String, List<String>> substitution = determineSubstitution(stack, frame);
        checkHypothesisMatch(stack, frame, substitution);
        for (int i = 0; i < frame.getArity(); i++) {
            stack.remove(stack.size()-1);
        }
        stack.add(applySubstitution(frame.getAssertion().getSymbols(), substitution));
    }

    private static Map<String,List<String>> determineSubstitution(List<List<String>> stack, Frame frame) {
        final HashMap<String, List<String>> substitution = new HashMap<>();
        final int stackBaseIdx = stack.size() - frame.getArity();
        for (int i = 0; i < frame.getTypes().size(); i++) {
            final ListStatement frameType = frame.getTypes().get(i);
            final List<String> stackType = stack.get(stackBaseIdx + i);
            if (!stackType.get(0).equals(frameType.getSymbols().get(0))) {
                throw new MetamathException("!stackType.get(0).equals(frameType.getSymbols().get(0))");
            }
            substitution.put(frameType.getSymbols().get(1), tail(stackType));
        }
        return substitution;
    }

    private static void checkHypothesisMatch(List<List<String>> stack, Frame frame, Map<String, List<String>> substitution) {
        final int stackBaseIdx = stack.size() - frame.getHypotheses().size();
        for (int i = 0; i < frame.getHypotheses().size(); i++) {
            if (!applySubstitution(frame.getHypotheses().get(i).getSymbols(), substitution).equals(stack.get(stackBaseIdx + i))) {
                throw new MetamathException("Hypotheses don't match");
            }
        }
    }

    private static List<String> applySubstitution(List<String> expr, Map<String, List<String>> substitution) {
        final ArrayList<String> result = new ArrayList<>();
        for (String sym : expr) {
            if (substitution.containsKey(sym)) {
                result.addAll(substitution.get(sym));
            } else {
                result.add(sym);
            }
        }
        return result;
    }

    private static <T> List<T> tail(List<T> list) {
        final ArrayList<T> tail = new ArrayList<>();
        for (int i = 1; i < list.size(); i++) {
            tail.add(list.get(i));
        }
        return tail;
    }

}
