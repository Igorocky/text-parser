package org.igye.metamath;

import lombok.SneakyThrows;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.tuple.Pair;
import org.igye.textparser.ParseResult;
import org.igye.textparser.Parser;
import org.igye.textparser.ParserException;
import org.igye.textparser.PositionInText;
import org.igye.textparser.SimpleTokenStreamImpl;
import org.igye.textparser.StringsTokenGenerator;
import org.igye.textparser.TextParsers;
import org.igye.textparser.TokenStream;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.or;
import static org.igye.textparser.Parsers.rec;
import static org.igye.textparser.Parsers.stream;
import static org.igye.textparser.TextParsers.charSeq;
import static org.igye.textparser.TextParsers.list;
import static org.igye.textparser.TextParsers.literal;
import static org.igye.textparser.TextParsers.nonSpace;
import static org.igye.textparser.TextParsers.space;
import static org.igye.textparser.TextParsers.spacePadded;

public class MetamathParsers {

    private static final HashSet<String> KEYWORDS = new HashSet<>(Arrays.asList("${", "$}", "$c", "$v", "$f", "$e", "$d",
            "$a", "$p", "$.", "$=", "$(", "$)", "$[", "$]"));

    @SneakyThrows
    public static MetamathDatabase load(String filePath) {
        return load(new FileInputStream(filePath));
    }

    public static MetamathDatabase load(InputStream inputStream) {
        Pair<Preprocessed, List<Statement>> parsed = parse(inputStream);
        final List<Statement> statements = parsed.getRight();
        defineFrames(statements);
        final MetamathDatabase database = new MetamathDatabase(statements);
        appendDescriptions(database, parsed.getLeft().getCode());
        return database;
    }

    @SneakyThrows
    protected static Pair<Preprocessed,List<Statement>> parse(String filePath) {
        return parse(new FileInputStream(filePath));
    }

    protected static Pair<Preprocessed,List<Statement>> parse(InputStream inputStream) {
        final Preprocessed preprocessed = preprocess(inputStream);
        final ArrayList<Statement> statements = new ArrayList<>();
        stream(
                statement(),
                () -> new SimpleTokenStreamImpl(new StringsTokenGenerator(
                        preprocessed.getCode().stream()
                        .map(code -> Pair.of(code.getBegin(), code.getText()))
                        .collect(Collectors.toList())
                ))
        ).forEach(partParseResult -> {
            final ParseResult parseResult = (ParseResult) partParseResult;
            if (parseResult.isSuccess()) {
                statements.add((Statement) parseResult.get());
            } else {
                final PositionInText position = (PositionInText) parseResult.getRemainingTokens().head().position();
                throw new ParserException("Parse error: " + parseResult.getFailureReason()
                        + " at line=" + position.getLine() + ", col=" + position.getCol());
            }
        });
        return Pair.of(preprocessed,statements);
    }

    @SneakyThrows
    protected static Preprocessed preprocess(String filePath) {
        return preprocess(new FileInputStream(filePath));
    }

    protected static Preprocessed preprocess(InputStream inputStream) {
        final Preprocessed preprocessed = new Preprocessed();
        final Object[] prevPart = {null};
        stream(
                or(comment(), nonComment()),
                () -> TextParsers.inputStreamToTokenStream(inputStream)
        ).forEach(partParseResult -> {
            if (partParseResult.isFailure()) {
                throw new ParserException("Preprocess error: " + partParseResult.getFailureReason());
            }
            Object part = partParseResult.get();
            if (part instanceof NonComment) {
                final NonComment nonComment = (NonComment) part;
                if (prevPart[0] != null && prevPart[0] instanceof Comment) {
                    nonComment.setPrecedingComment((Comment) prevPart[0]);
                }
                preprocessed.getCode().add(nonComment);
            } else {
                preprocessed.getComments().add((Comment) part);
            }
            prevPart[0] = part;
        });
        return preprocessed;
    }

    protected static Parser<TokenStream<Character, PositionInText>, Statement, PositionInText> statement() {
        return (Parser) or(blockStatement(), nonLabeledListStatement(), labeledListStatement(), theoremStatement());
    }

    protected static Parser<TokenStream<Character, PositionInText>, BlockStatement, PositionInText> blockStatement() {
        return (Parser) spacePadded(and(
                literal("${"),
                list(or(nonLabeledListStatement(),labeledListStatement(),theoremStatement(),rec(() -> blockStatement()))),
                literal("$}")
        ))
                .map((list, pos) -> BlockStatement.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .content(((List<List<Statement>>) list).get(1))
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, ListStatement, PositionInText> nonLabeledListStatement() {
        return (Parser) spacePadded(and(
                and(literal("$"), or(literal("c"), literal("v"), literal("d"))),
                list(nonSpace("$.")),
                literal("$.")
        ))
                .map((list, pos) -> ListStatement.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .type(ListStatementType.fromString(((List<String>) ((List<Object>) list).get(0)).get(1)))
                        .symbols(((List<String>) ((List<Object>) list).get(1)))
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, ListStatement, PositionInText> labeledListStatement() {
        return (Parser) spacePadded(and(
                nonSpace(KEYWORDS),
                space(),
                and(literal("$"), or(literal("f"), literal("e"), literal("a"))),
                list(nonSpace("$.")),
                literal("$.")
        ))
                .map((list, pos) -> ListStatement.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .label((String) ((List<Object>) list).get(0))
                        .type(ListStatementType.fromString(((List<String>) ((List<Object>) list).get(2)).get(1)))
                        .symbols(((List<String>) ((List<Object>) list).get(3)))
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, ListStatement, PositionInText> theoremStatement() {
        return (Parser) spacePadded(and(
                nonSpace(KEYWORDS),
                space(),
                literal("$p"),
                list(nonSpace("$=")),
                literal("$="),
                space(),
                or(compressedProof(), list(nonSpace("$."))),
                literal("$.")
        ))
                .map((list, pos) -> {
                    final ListStatement.ListStatementBuilder theorem = ListStatement.builder()
                            .begin(pos.getStart())
                            .end(pos.getEnd())
                            .label((String) ((List<Object>) list).get(0))
                            .type(ListStatementType.THEOREM)
                            .symbols(((List<String>) ((List<Object>) list).get(3)));
                    final Object proofElem = ((List<Object>) list).get(6);
                    if (proofElem instanceof CompressedProof) {
                        theorem.compressedProof((CompressedProof) proofElem);
                    } else {
                        theorem.proof(((List<String>) proofElem));
                    }
                    return theorem.build();
                });
    }

    protected static Parser<TokenStream<Character, PositionInText>, CompressedProof, PositionInText> compressedProof() {
        return (Parser) and(
                literal("("),
                list(nonSpace(")")),
                literal(")"),
                list(nonSpace("$."))
        )
                .map((list, pos) -> CompressedProof.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .labels(((List<String>) ((List<Object>) list).get(1)))
                        .encodedProof(
                                StringUtils.join(((List<String>) ((List<Object>) list).get(3)), "")
                        )
                        .build()
                );
    }

    protected static List<String> splitEncodedProof(String proofStr) {
        final ArrayList<String> result = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < proofStr.length(); i++) {
            final char c = proofStr.charAt(i);
            if (c == 'Z') {
                result.add("Z");
            } else {
                sb.append(c);
                if ('A' <= c && c <= 'T') {
                    result.add(sb.toString());
                    sb = new StringBuilder();
                }
            }
        }
        if (sb.length() > 0) {
            throw new ParserException("sb.length() > 0");
        }
        return result;
    }

    protected static int strToInt(String str) {
        int result = 0;
        int base = 1;
        for (int i = str.length()-2; i >= 0; i--) {
            result += base*charToInt(str.charAt(i));
            base *= 5;
        }
        return result*20 + charToInt(str.charAt(str.length()-1));
    }

    private static int charToInt(char c) {
        if ('A' <= c && c <= 'T') {
            return c-64; //65 is A
        } else {
            return c-84; //85 is U
        }
    }

    private static Parser<TokenStream<Character, PositionInText>,Comment,PositionInText> comment() {
        return charSeq(
                "Metamath comment",
                () -> new StringBuilder(),
                (sb,ch,isLast) -> {
                    if (sb.length() == 0) {
                        if (ch == '$') {
                            sb.append(ch);
                            return -1;
                        } else {
                            return 0;
                        }
                    } else if (sb.length() == 1) {
                        if (ch == '(') {
                            sb.append(ch);
                            return -1;
                        } else {
                            return 0;
                        }
                    } else if (ch == ')' && sb.charAt(sb.length()-1) == '$') {
                        sb.append(ch);
                        return sb.length();
                    } else {
                        sb.append(ch);
                        return -1;
                    }
                },
                (sb,len) -> sb.delete(len-1,sb.length()).toString(),
                "A Metamath comment was expected"
        ).map((str,pos) ->
                Comment.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .text(str.substring(2,str.length()-2))
                        .build()
        );
    }

    private static Parser<TokenStream<Character, PositionInText>,NonComment,PositionInText> nonComment() {
        return charSeq(
                "Metamath non-comment",
                () -> new StringBuilder(),
                (sb,ch,isLast) -> {
                    if (ch == '(' && sb.length() > 0 && sb.charAt(sb.length()-1) == '$') {
                        return sb.length()-1;
                    } else {
                        sb.append(ch);
                        return isLast ? sb.length() : -1;
                    }
                },
                (sb,len) -> sb.delete(len,sb.length()).toString(),
                "A Metamath comment was expected"
        ).map((str,pos) ->
                NonComment.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .text(str)
                        .build()
        );
    }

    private static void defineFrames(List<Statement> statements) {
        defineFrames(null, new MetamathContext(), statements);
    }

    private static void defineFrames(BlockStatement currBlock, MetamathContext context, List<Statement> statements) {
        Statement prevStatement = null;
        for (Statement statement : statements) {
            if (statement instanceof BlockStatement) {
                final BlockStatement blockStatement = (BlockStatement) statement;
                defineFrames(blockStatement, context, (blockStatement).getContent());
                blockStatement.setCurrBlock(currBlock);
                blockStatement.setPrevStatement(prevStatement);
            } else {
                final ListStatement listStatement = (ListStatement) statement;
                if (listStatement.getType() == ListStatementType.AXIOM
                        || listStatement.getType() == ListStatementType.THEOREM) {
                    listStatement.setFrame(createFrame(context, listStatement));
                } else {
                    context = context.createChildContext(listStatement);
                }
                listStatement.setCurrBlock(currBlock);
                listStatement.setPrevStatement(prevStatement);
            }
            prevStatement = statement;
        }
    }

    private static Frame createFrame(MetamathContext context, ListStatement assertion) {
        if (assertion.getType() != ListStatementType.AXIOM && assertion.getType() != ListStatementType.THEOREM) {
            throw new ParserException(
                    "assertion.getType() != ListStatementType.AXIOM " +
                            "&& assertion.getType() != ListStatementType.THEOREM: at " + assertion.getBegin()
            );
        }
        final Frame frame = new Frame();
        frame.setContext(context);
        frame.setAssertion(assertion);
        frame.setHypotheses(context.getAllHypotheses());
        frame.setTypes(new ArrayList<>());
        final Set<String> allSymbols = Stream.concat(
                frame.getHypotheses().stream().flatMap(hyp -> hyp.getSymbols().stream()),
                frame.getAssertion().getSymbols().stream()
        ).collect(Collectors.toSet());
        final SymbolsInfo symbolsInfo = context.getSymbolsInfo();
        for (String sym : allSymbols) {
            if (symbolsInfo.getConstants().contains(sym)) {
                continue;
            }
            ListStatement type = symbolsInfo.getVarTypes().get(sym);
            if (type != null) {
                if (type == null) {
                    throw new ParserException("Cannot determine type of variable: '"
                            + sym + "' at " + assertion.getBegin());
                } else {
                    frame.getTypes().add(type);
                    continue;
                }
            }
            throw new ParserException("Only constant or variable was expected but got: '"
                    + sym + "' at " + assertion.getBegin());
        }
        Collections.sort(frame.getTypes(), Comparator.comparing(ListStatement::getBegin));
        return frame;
    }

    private static void appendDescriptions(MetamathDatabase database, List<NonComment> preprocessedCode) {
        final List<ListStatement> allAssertions = database.getAllAssertions();
        Collections.sort(allAssertions, Comparator.comparing(ListStatement::getBegin));
        for (int i = 0; i < preprocessedCode.size(); i++) {
            NonComment codePart = preprocessedCode.get(i);
            if (codePart.getPrecedingComment() != null) {
                int aIdx = 0;
                while (aIdx < allAssertions.size() && allAssertions.get(aIdx).getBegin().compareTo(codePart.getBegin()) < 0) {
                    aIdx++;
                }
                if (allAssertions.size() <= aIdx) {
                    return;
                }
                allAssertions.get(aIdx).setDescription(codePart.getPrecedingComment().getText().trim());
            }
        }
    }
}
