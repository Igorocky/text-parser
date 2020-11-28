package org.igye.metamath;

import lombok.SneakyThrows;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.igye.common.Utils;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.Stack;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class MetamathTools {

    private static final Pattern COMPONENT_NAME_PATTERN = Pattern.compile("const viewComponent = ComponentName");
    private static final Pattern VIEW_PROPS_PATTERN = Pattern.compile("const viewProps = \\{\\}");

    public static void main(String[] args) {
        System.out.println(Instant.now().toString()
                .replace("T","__")
                .replace(':','_')
                .replaceAll("\\.\\d\\d\\dZ","_Z")
        );
    }

    public static void generateProofExplorer(List<ListStatement> assertions, String pathToDirToSaveTo) {
        File dirToSaveTo = new File(pathToDirToSaveTo);
        if (dirToSaveTo.exists()) {
            throw new MetamathException("The directory already exists: " + dirToSaveTo.getAbsolutePath());
        }
        dirToSaveTo.mkdirs();
        copyUiFileToDir("/ui/css/styles.css", dirToSaveTo);
        copyUiFileToDir("/ui/js/lib/react.production-16.8.6.min.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/lib/react-dom.production-16.8.6.min.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/lib/material-ui.production-4.11.0.min.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/utils/react-imports.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/utils/data-functions.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/utils/svg-functions.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/utils/rendering-functions.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/Assertion.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/ConstProofNode.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/RuleProofNode.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/MetamathProof.js", dirToSaveTo);
        for (ListStatement assertion : assertions) {
            if (assertion.getType() == ListStatementType.THEOREM) {
                createAssertionHtmlFile(
                        assertion,
                        MetamathTools.visualizeProof(assertion),
                        new File(dirToSaveTo,assertion.getLabel()+".html")
                );
            }
        }
    }

    public static ProofDto visualizeProof(ListStatement theorem) {
        final ArrayList<StackNodeDto> nodes = new ArrayList<>();
        final StackNode proof = verifyProof(theorem);
        Map<StackNode, Integer> ids = generateIds(proof);
        iterateNodes(proof, node -> {
            if (node instanceof RuleStackNode) {
                final RuleStackNode ruleNode = (RuleStackNode) node;
                final Frame frame = ruleNode.getAssertion().getFrame();
                nodes.add(
                        StackNodeDto.builder()
                                .id(ids.get(node))
                                .args(ruleNode.getArgs().stream().map(ids::get).collect(Collectors.toList()))
                                .type(ruleNode.getAssertion().getType().getShortName().toUpperCase())
                                .label(ruleNode.getAssertion().getLabel())
                                .params(
                                        Stream.concat(
                                                frame.getTypes().stream(),
                                                frame.getHypotheses().stream()
                                        )
                                                .map(stm -> stm.getSymbols())
                                                .collect(Collectors.toList())
                                )
                                .numOfTypes(frame.getTypes().size())
                                .retVal(ruleNode.getAssertion().getSymbols())
                                .substitution(ruleNode.getSubstitution())
                                .expr(ruleNode.getExpr())
                                .build()
                );
            } else {
                final ConstStackNode constNode = (ConstStackNode) node;
                nodes.add(
                        StackNodeDto.builder()
                                .id(ids.get(node))
                                .type(constNode.getStatement().getType().getShortName().toUpperCase())
                                .label(constNode.getStatement().getLabel())
                                .expr(constNode.getExpr())
                                .build()
                );
            }
        });

        final HashMap<String, String> varTypes = new HashMap<>();
        nodes.stream()
                .flatMap(node -> Stream.concat(
                        Stream.concat(
                                node.getParams()==null?Stream.empty():node.getParams().stream().flatMap(List::stream),
                                node.getRetVal()==null?Stream.empty():node.getRetVal().stream()
                        ),
                        node.getExpr().stream()
                ))
                .map(theorem.getFrame().getContext()::getType)
                .filter(Objects::nonNull)
                .forEach(var -> varTypes.put(var.getSymbols().get(1), var.getSymbols().get(0)));

        return ProofDto.builder()
                .nodes(nodes)
                .varTypes(varTypes)
                .build();
    }

    public static StackNode verifyProof(ListStatement theorem) {
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
        final StackNode finalStackNode = stack.get(0);
        if (!finalStackNode.getExpr().equals(theorem.getSymbols())) {
            throw new MetamathException("!stack.get(0).equals(theorem.getSymbols())");
        }
        return finalStackNode;
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
            curStmt = MetamathTools.determinePrevStatement(curStmt);
        }

        return result;
    }

    public static String stringify(ListStatement statement) {
        return StringUtils.join(statement.getSymbols(), ' ');
    }

    public static String stringify(Collection<ListStatement> statements) {
        return "["
                + statements.stream().map(MetamathTools::stringify).collect(Collectors.joining(", "))
                + "]";
    }

    public static String stringify(Frame frame) {
        return "["
                + stringify(frame.getTypes())
                + ", " + stringify(frame.getHypotheses())
                + ", " + stringify(frame.getAssertion())
                + "]";
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
        return tail(list, 1);
    }

    private static <T> List<T> tail(List<T> list, int elemsToSkip) {
        final ArrayList<T> tail = new ArrayList<>();
        for (int i = elemsToSkip; i < list.size(); i++) {
            tail.add(list.get(i));
        }
        return tail;
    }

    private static void iterateNodes(StackNode node, Consumer<StackNode> nodeConsumer) {
        Set<StackNode> processed = new HashSet<>();
        Stack<StackNode> toProcess = new Stack<>();
        toProcess.push(node);
        while (!toProcess.isEmpty()) {
            final StackNode curNode = toProcess.pop();
            if (!processed.contains(curNode)) {
                nodeConsumer.accept(curNode);
                processed.add(curNode);
                if (curNode instanceof RuleStackNode) {
                    toProcess.addAll(((RuleStackNode) curNode).getArgs());
                }
            }
        }
    }

    private static Map<StackNode,Integer> generateIds(StackNode root) {
        final int[] id = {1};
        final HashMap<StackNode, Integer> ids = new HashMap<>();
        iterateNodes(root, node -> ids.put(node, id[0]++));
        return ids;
    }

    private static void copyUiFileToDir(String fileInClassPath, File dir) {
        copyFromClasspathToDir(1, fileInClassPath, dir);
    }

    private static void copyFromClasspathToDir(int numOfDirsToSkip, String fileInClassPath, File dir) {
        copyFromClasspathToDir(numOfDirsToSkip, fileInClassPath, dir, Function.identity());
    }

    @SneakyThrows
    private static void copyFromClasspathToDir(int numOfDirsToSkip, String fileInClassPath, File dir, Function<String,String> modifier) {
        String content = IOUtils.resourceToString(fileInClassPath, StandardCharsets.UTF_8);
        final File destFile = new File(
                dir,
                StringUtils.join(tail(Arrays.asList(fileInClassPath.split("/|\\\\")), numOfDirsToSkip+1),'/')
        );
        FileUtils.writeStringToFile(destFile, modifier.apply(content), StandardCharsets.UTF_8);
    }

    @SneakyThrows
    private static void copyFromClasspath(String fileInClassPath, Function<String,String> modifier, File destFile) {
        String content = IOUtils.resourceToString(fileInClassPath, StandardCharsets.UTF_8);
        FileUtils.writeStringToFile(destFile, modifier.apply(content), StandardCharsets.UTF_8);
    }

    private static void createAssertionHtmlFile(ListStatement assertion, ProofDto proofDto, File destFile) {
        copyFromClasspath(
                "/ui/index.html",
                html -> {
                    html = Utils.replace(
                            html,
                            COMPONENT_NAME_PATTERN,
                            matcher -> "const viewComponent = MetamathProof"
                    );
                    html = Utils.replace(
                            html,
                            VIEW_PROPS_PATTERN,
                            matcher -> {
                                final Map<String, Object> viewProps = new HashMap<>();
                                viewProps.put("type", getTypeStr(assertion.getType()));
                                viewProps.put("name", assertion.getLabel());
                                viewProps.put("description", assertion.getDescription());
                                viewProps.put(
                                        "assertion",
                                        StackNodeDto.builder()
                                                .params(
                                                        assertion.getFrame().getHypotheses().stream()
                                                                .map(ListStatement::getSymbols)
                                                                .collect(Collectors.toList())
                                                )
                                                .retVal(assertion.getFrame().getAssertion().getSymbols())
                                                .build()
                                );
                                viewProps.put("proof", proofDto);
                                return "const viewProps = " + Utils.toJson(viewProps);
                            }
                    );
                    return html;
                },
                destFile
        );
    }

    private static String getTypeStr(ListStatementType type) {
        return type == ListStatementType.AXIOM ? "Axiom"
                : type == ListStatementType.THEOREM ? "Theorem"
                : type.name();
    }

}
