package org.igye.metamath;

import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
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

    public static void verifyProof(ListStatement theorem) {
        List<StackNode> stack = new ArrayList<>();
        if (theorem.getProof() != null) {
            final Map<String, ListStatement> requiredStatements =
                    theorem.findActiveStatements(new HashSet<>(theorem.getProof()));
            eval(
                    stack,
                    theorem.getProof().stream().map(requiredStatements::get).collect(Collectors.toList())
            );
        } else {
            evalCompressed(stack, theorem);
        }
        if (stack.size() != 1) {
            throw new MetamathException("stack.size() != 1");
        }
        if (!stack.get(0).getExpr().equals(theorem.getSymbols())) {
            throw new MetamathException("!stack.get(0).equals(theorem.getSymbols())");
        }
    }

    public static Map<String,ListStatement> findActiveStatements(Statement curStmt, Set<String> labels) {
        final HashMap<String, ListStatement> result = new HashMap<>();
        while (curStmt != null) {
            if (curStmt instanceof BlockStatement) {
                Map<String, ListStatement> foundAssertions = ((BlockStatement) curStmt).findAssertions(labels);
                for (String foundAssertionLabel : foundAssertions.keySet()) {
                    if (result.containsKey(foundAssertionLabel)) {
                        throw new MetamathException("result.containsKey(foundAssertionLabel)");
                    }
                }
                result.putAll(foundAssertions);
            } else {
                final ListStatement listStatement = (ListStatement) curStmt;
                final String label = listStatement.getLabel();
                if (label != null && labels.contains(label)) {
                    if (result.containsKey(label)) {
                        throw new MetamathException("result.containsKey(listStatement.getLabel())");
                    } else {
                        result.put(label, listStatement);
                    }
                }
            }
            curStmt = Metamath.determinePrevStatement(curStmt);
        }

        return result;
    }

    protected static Statement determinePrevStatement(Statement statement) {
        if (statement.getPrevStatement() != null) {
            return statement.getPrevStatement();
        } else {
            return statement.getCurrBlock() != null ? statement.getCurrBlock().getPrevStatement() : null;
        }
    }

    private static void evalCompressed(List<StackNode> stack, ListStatement theorem) {
        final List<String> steps = MetamathParsers.splitEncodedProof(theorem.getCompressedProof().getEncodedProof());
        List<Object> args = new ArrayList<>();
        args.addAll(theorem.getFrame().getTypes());
        args.addAll(theorem.getFrame().getHypotheses());

        final Map<String, ListStatement> requiredStatements =
                theorem.findActiveStatements(new HashSet<>(theorem.getCompressedProof().getLabels()));
        theorem.getCompressedProof().getLabels().stream()
                .map(requiredStatements::get)
                .forEach(args::add);

        for (String step : steps) {
            if ("Z".equals(step)) {
                args.add(stack.get(stack.size()-1));
            } else {
                Object arg = args.get(MetamathParsers.strToInt(step)-1);
                if (arg instanceof StackNode) {
                    stack.add((StackNode) arg);
                } else {
                    eval(stack, Collections.singletonList(((ListStatement) arg)));
                }
            }
        }
    }

    private static void eval(List<StackNode> stack, List<ListStatement> statements) {
        for (ListStatement statement : statements) {
            if (statement.getType() == ListStatementType.FLOATING
                    || statement.getType() == ListStatementType.ESSENTIAL) {
                stack.add(new ConstStackNode(statement));
            } else {
                apply(stack, statement);
            }
        }
    }

    private static void apply(List<StackNode> stack, ListStatement statement) {
        final Frame frame = statement.getFrame();
        if (stack.size() < frame.getArity()) {
            throw new MetamathException("stack.size() < frame.getTypes().size() + frame.getHypothesis().size()");
        }
        final Map<String, List<String>> substitution = determineSubstitution(stack, frame);
        checkHypothesisMatch(stack, frame, substitution);
        final ArrayList<StackNode> args = new ArrayList<>();
        for (int i = 0; i < frame.getArity(); i++) {
            args.add(stack.remove(stack.size()-1));
        }
        Collections.reverse(args);
        stack.add(
                RuleStackNode.builder()
                        .args(args)
                        .assertion(statement)
                        .substitution(substitution)
                        .expr(applySubstitution(frame.getAssertion().getSymbols(), substitution))
                        .build()
        );
    }

    private static Map<String,List<String>> determineSubstitution(List<StackNode> stack, Frame frame) {
        final HashMap<String, List<String>> substitution = new HashMap<>();
        final int stackBaseIdx = stack.size() - frame.getArity();
        for (int i = 0; i < frame.getTypes().size(); i++) {
            final ListStatement frameType = frame.getTypes().get(i);
            final StackNode stackType = stack.get(stackBaseIdx + i);
            if (!stackType.getExpr().get(0).equals(frameType.getSymbols().get(0))) {
                throw new MetamathException("!stackType.get(0).equals(frameType.getSymbols().get(0))");
            }
            substitution.put(frameType.getSymbols().get(1), tail(stackType.getExpr()));
        }
        return substitution;
    }

    private static void checkHypothesisMatch(List<StackNode> stack, Frame frame, Map<String, List<String>> substitution) {
        final int stackBaseIdx = stack.size() - frame.getHypotheses().size();
        for (int i = 0; i < frame.getHypotheses().size(); i++) {
            if (!applySubstitution(frame.getHypotheses().get(i).getSymbols(), substitution).equals(stack.get(stackBaseIdx + i).getExpr())) {
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
