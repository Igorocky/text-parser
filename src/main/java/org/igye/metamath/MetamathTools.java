package org.igye.metamath;

import lombok.SneakyThrows;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.igye.common.DebugTimer;
import org.igye.common.Utils;
import org.igye.textparser.PositionInText;

import java.io.File;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.Stack;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ConcurrentSkipListMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.igye.metamath.CompressionUtils.compress;

public class MetamathTools {

    private static final String DOT_REPLACEMENT = "-dot-";

    @SneakyThrows
    public static void generateProofExplorer(
            List<ListStatement> assertions, int numOfThreads, String pathToDirToSaveTo) {
        final Instant start = Instant.now();
        System.out.println("Writing common files...");
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
        copyUiFileToDir("/ui/js/utils/all-imports.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/Pagination.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/Assertion.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/ConstProofNode.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/RuleProofNode.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/MetamathAssertionView.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/MetamathIndexTable.js", dirToSaveTo);
        copyUiFileToDir("/ui/js/components/MetamathIndexView.js", dirToSaveTo);

        Queue<ListStatement> queue = new ConcurrentLinkedQueue<>(assertions);

        final ExecutorService executorService = Executors.newFixedThreadPool(numOfThreads);
        File dataDir = new File(dirToSaveTo, "data");
        AtomicInteger filesWrittenAtomic = new AtomicInteger();
        final Map<PositionInText,IndexElemDto> indexElems = new ConcurrentSkipListMap<>();
        AtomicReference<Exception> errorOccurred = new AtomicReference<>(null);
        for (int i = 0; i < numOfThreads; i++) {
            executorService.submit(() -> {
                ListStatement assertion = queue.poll();
                while (assertion != null && errorOccurred.get() == null) {
                    try {
                        ListStatement finalAssertion = assertion;
                        AssertionDto dto = DebugTimer.call("visualizeAssertion", () -> visualizeAssertion(finalAssertion));
                        DebugTimer.run("createAssertionHtmlFile", () -> createAssertionHtmlFile(dto, dataDir, createRelPathToSaveTo(dto.getName())));
                        indexElems.put(assertion.getBegin(), createIndexElemDto(dto));
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                        e.printStackTrace();
                        errorOccurred.set(e);
                    }
                    assertion = queue.poll();
                    int filesWritten = filesWrittenAtomic.incrementAndGet();
                    final double pct = (filesWritten * 1.0 / assertions.size()) * 100;
                    System.out.println("Writing DTOs - "
                            + new BigDecimal(pct).setScale(1, BigDecimal.ROUND_HALF_UP) + "%" +
                            " (" + filesWritten + " of " + assertions.size() + "). "
                    );
                }
            });
        }

        executorService.shutdown();
        executorService.awaitTermination(1, TimeUnit.DAYS);
        if (errorOccurred.get() != null) {
            throw errorOccurred.get();
        }

        System.out.println("Writing index...");
        createHtmlFile("",
                "MetamathIndexView",
                compress(buildIndex(indexElems.values())),
                new File(dirToSaveTo, "index.html")
        );
    }

    private static IndexDto buildIndex(Collection<IndexElemDto> indexElems) {
        final int[] id = {0};
        return IndexDto.builder()
                .elems(
                        indexElems.stream()
                                .map(elem -> {
                                    elem.setId(id[0]++);
                                    return elem;
                                })
                                .collect(Collectors.toList())
                )
                .build();
    }

    private static IndexElemDto createIndexElemDto(AssertionDto assertionDto) {
        return IndexElemDto.builder()
                .type(assertionDto.getType().substring(0,1))
                .label(assertionDto.getName())
                .hypotheses(tail(assertionDto.getAssertion().getParams(), assertionDto.getAssertion().getNumOfTypes()))
                .expression(assertionDto.getAssertion().getRetVal())
                .varTypes(assertionDto.getVarTypes())
                .build();
    }

    public static AssertionDto visualizeAssertion(ListStatement assertion) {
        final AssertionDto.AssertionDtoBuilder assertionDto = AssertionDto.builder();
        assertionDto.type(getTypeStr(assertion.getType()));
        assertionDto.name(assertion.getLabel());
        assertionDto.description(assertion.getDescription());
        assertionDto.assertion(
                StackNodeDto.builder()
                        .params(
                                assertion.getFrame().getHypotheses().stream()
                                        .map(ListStatement::getSymbols)
                                        .collect(Collectors.toList())
                        )
                        .retVal(assertion.getFrame().getAssertion().getSymbols())
                        .build()
        );

        final HashMap<String, String> varTypes = new HashMap<>();
        assertionDto.varTypes(varTypes);
        varTypes.putAll(DebugTimer.call("extractVarTypes-1", () -> extractVarTypes(
                assertion.getFrame().getContext(),
                Stream.concat(
                        assertion.getFrame().getHypotheses().stream().flatMap(h -> h.getSymbols().stream()),
                        assertion.getFrame().getAssertion().getSymbols().stream()
                ).collect(Collectors.toSet())
        )));

        if (assertion.getType() == ListStatementType.THEOREM) {
            final ArrayList<StackNodeDto> nodes = new ArrayList<>();
            final StackNode proof = DebugTimer.call("verifyProof", () -> verifyProof(assertion));
            DebugTimer.run("iterateNodes", () -> iterateNodes(proof, node -> {
                if (node instanceof RuleStackNode) {
                    final RuleStackNode ruleNode = (RuleStackNode) node;
                    final Frame frame = ruleNode.getAssertion().getFrame();
                    nodes.add(
                            StackNodeDto.builder()
                                    .id(node.getId())
                                    .args(ruleNode.getArgs().stream().map(StackNode::getId).collect(Collectors.toList()))
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
                                    .id(node.getId())
                                    .type(constNode.getStatement().getType().getShortName().toUpperCase())
                                    .label(constNode.getStatement().getLabel())
                                    .expr(constNode.getExpr())
                                    .build()
                    );
                }
            }));
            Collections.sort(nodes, Comparator.comparing(StackNodeDto::getId));
            assertionDto.proof(nodes);

            varTypes.putAll(DebugTimer.call("extractVarTypes-2", () -> extractVarTypes(
                    assertion.getFrame().getContext(),
                    nodes.stream()
                            .flatMap(node -> Stream.concat(
                                    Stream.concat(
                                            node.getParams()==null?Stream.empty():node.getParams().stream().flatMap(List::stream),
                                            node.getRetVal()==null?Stream.empty():node.getRetVal().stream()
                                    ),
                                    node.getExpr().stream()
                            )).collect(Collectors.toSet())
            )));
        }

        return assertionDto.build();
    }

    public static StackNode verifyProof(ListStatement theorem) {
        ProofStack stack = new ProofStack();
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

    private static void evalCompressed(ProofStack stack, ListStatement theorem) {
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

    private static void eval(ProofStack stack, List<ListStatement> statements) {
        for (ListStatement statement : statements) {
            if (statement.getType() == ListStatementType.FLOATING
                    || statement.getType() == ListStatementType.ESSENTIAL) {
                stack.add(new ConstStackNode(statement));
            } else {
                apply(stack, statement);
            }
        }
    }

    private static void apply(ProofStack stack, ListStatement statement) {
        final Frame frame = statement.getFrame();
        if (stack.size() < frame.getArity()) {
            throw new MetamathException("stack.size() < frame.getTypes().size() + frame.getHypothesis().size()");
        }
        final Map<String, List<String>> substitution = determineSubstitution(stack, frame);
        checkHypothesisMatch(stack, frame, substitution);
        final List<StackNode> args = stack.removeLast(frame.getArity());
        stack.add(
                RuleStackNode.builder()
                        .args(args)
                        .assertion(statement)
                        .substitution(substitution)
                        .expr(applySubstitution(frame.getAssertion().getSymbols(), substitution))
                        .build()
        );
    }

    private static Map<String,List<String>> determineSubstitution(ProofStack stack, Frame frame) {
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

    private static void checkHypothesisMatch(ProofStack stack, Frame frame, Map<String, List<String>> substitution) {
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

    private static void iterateNodes(StackNode root, Consumer<StackNode> nodeConsumer) {
        Set<StackNode> processed = new HashSet<>();
        Stack<StackNode> toProcess = new Stack<>();
        toProcess.push(root);
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

    private static void createHtmlFile(String relPathPrefix, String viewComponentName, Object viewProps, File file) {
        final String viewPropsStr = Utils.toJson(Utils.toJson(viewProps));
        final String decompressionFunctionName =
                viewProps instanceof CompressedAssertionDto ? "decompressAssertionDto"
                : viewProps instanceof CompressedIndexDto2 ? "decompressIndexDto"
                : null;
        if (decompressionFunctionName == null) {
            throw new MetamathException("decompressionFunctionName == null");
        }
        copyFromClasspath(
                "/ui/index.html",
                html -> html
                        .replace("$pathPrefix", relPathPrefix)
                        .replace("$componentName", viewComponentName)
                        .replace("$decompressionFunction", decompressionFunctionName)
                        .replace("'$viewProps'", viewPropsStr)
                        .replace("src=\"", "src=\"" + relPathPrefix),
                file
        );
    }

    private static void createAssertionHtmlFile(AssertionDto assertionDto, File dataDir, List<String> relPath) {
        final String relPathPrefix = relPath.stream()
                .map(p -> "..")
                .collect(Collectors.joining("/"))
                + "/";
        createHtmlFile(
                relPathPrefix,
                "MetamathAssertionView",
                compress(assertionDto),
                new File(dataDir, StringUtils.join(relPath, '/'))
        );
    }

    private static String getTypeStr(ListStatementType type) {
        return type == ListStatementType.AXIOM ? "Axiom"
                : type == ListStatementType.THEOREM ? "Theorem"
                : type.name();
    }

    public static void main(String[] args) {
        if (1 == 1) throw new MetamathException("");
        if (1 != 1) {
            Map<String, List<String>> files = new HashMap<>();
            final MetamathDatabase database = MetamathParsers.load("D:\\Install\\metamath\\metamath\\set.mm");
            final List<ListStatement> allAssertions = database.getAllAssertions();
            System.out.println("Len = 1: " + allAssertions.stream().filter(a -> a.getLabel().length() == 1).count());
            allAssertions.stream().filter(a -> a.getLabel().length() == 1).forEach(a -> System.out.println("- " + a.getLabel()));
            for (ListStatement assertion : allAssertions) {
                final String relPath = Utils.toJson(getRelPath(assertion.getLabel()));
                files.computeIfAbsent(relPath, p -> new ArrayList<>()).add(assertion.getLabel() + ".html");

            }
            files.entrySet().stream()
                    .filter(e -> e.getValue().size() > 50)
                    .sorted(Comparator.comparing(Map.Entry::getKey))
                    .forEach(e -> {
                        System.out.println(e.getKey() + " = " + e.getValue().size());
                    });
        }
    }

    private static List<String> getRelPath(String label) {
        label = StringUtils.trim(label);
        if (StringUtils.isBlank(label)) {
            throw new MetamathException("StringUtils.isBlank(label)");
        }
        if (label.length() >= 6) {
            return Arrays.asList(label.substring(0,2), label.substring(2,4), label.substring(4,6));
        } else if (label.length() >= 4) {
            return Arrays.asList(label.substring(0,2), label.substring(2,4));
        } else if (label.length() >= 2) {
            return Arrays.asList(label.substring(0,2));
        } else {
            return Collections.singletonList(label);
        }
    }

    protected static List<String> createRelPathToSaveTo(String label) {
        if (label.indexOf(DOT_REPLACEMENT) >= 0) {
            throw new MetamathException("label.indexOf(DOT_REPLACEMENT) >= 0");
        }
        final ArrayList<String> result = new ArrayList<>(
                getRelPath(label).stream()
                        .map(MetamathTools::replaceDots)
                        .collect(Collectors.toList())
        );
        result.add(replaceDots(label) + ".html");
        return result;
    }

    private static String replaceDots(String str) {
        return str.replace(".", DOT_REPLACEMENT);
    }

    private static Map<String,String> extractVarTypes(MetamathContext context, Set<String> symbols) {
        return context.getSymbolsInfo().getVarTypes().entrySet().stream()
                .filter(entry -> symbols.contains(entry.getKey()))
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> entry.getValue().getSymbols().get(0)
                ));
    }
}
