package org.igye.metamath;

import lombok.SneakyThrows;
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
import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.debug;
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

    public static final HashSet<String> KEYWORDS = new HashSet<>(Arrays.asList("${", "$}", "$c", "$v", "$f", "$e", "$d",
            "$a", "$p", "$.", "$=", "$(", "$)", "$[", "$]"));

    @SneakyThrows
    public static List<Statement> parse(String filePath) {
        return parse(new FileInputStream(filePath));
    }

    public static List<Statement> parse(InputStream inputStream) {
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
        return statements;
    }

    @SneakyThrows
    protected static Preprocessed preprocess(String filePath) {
        return preprocess(new FileInputStream(filePath));
    }

    protected static Preprocessed preprocess(InputStream inputStream) {
        final Preprocessed preprocessed = new Preprocessed();
        stream(
                or(comment(), nonComment()),
                () -> TextParsers.inputStreamToTokenStream(inputStream)
        ).forEach(partParseResult -> {
            if (partParseResult.isFailure()) {
                throw new ParserException("Preprocess error: " + partParseResult.getFailureReason());
            }
            Object part = partParseResult.get();
            if (part instanceof NonComment) {
                preprocessed.getCode().add((NonComment) part);
            } else {
                preprocessed.getComments().add((Comment) part);
            }
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
                list(nonSpace("$.")),
                literal("$.")
        ))
                .map((list, pos) -> ListStatement.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .label((String) ((List<Object>) list).get(0))
                        .type(ListStatementType.THEOREM)
                        .symbols(((List<String>) ((List<Object>) list).get(3)))
                        .proof(((List<String>) ((List<Object>) list).get(5)))
                        .build()
                );
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
}
