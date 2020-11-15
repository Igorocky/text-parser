package org.igye.metamath;

import lombok.SneakyThrows;
import org.igye.textparser.ParseResult;
import org.igye.textparser.Parser;
import org.igye.textparser.ParserException;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TextParsers;
import org.igye.textparser.TokenStream;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.or;
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
    public static Preprocessed preprocess(String filePath) {
        return preprocess(new FileInputStream(filePath));
    }

    public static Preprocessed preprocess(InputStream inputStream) {
        final Preprocessed preprocessed = new Preprocessed();
        final ParseResult[] lastResult = new ParseResult[1];
        final PositionInText[] startPos = new PositionInText[1];
        final PositionInText[] endPos = new PositionInText[1];
        stream(
                spacePadded(or(comment(), nonComment())),
                () -> TextParsers.inputStreamToTokenStream(inputStream)
        ).forEach(partParseResult -> {
            lastResult[0] = partParseResult;
            if (startPos[0] == null) {
                startPos[0] = partParseResult.getPositionRange().getStart();
            }
            endPos[0] = partParseResult.getPositionRange().getEnd();
            Object part = partParseResult.get();
            if (part instanceof NonComment) {
                preprocessed.getCode().add((NonComment) part);
            } else {
                preprocessed.getComments().add((Comment) part);
            }
        });
        if (lastResult[0].isFailure()) {
            throw new ParserException("Parse error: " + lastResult[0].getFailureReason());
        } else {
            return preprocessed;
        }
    }

    protected static Parser<TokenStream<Character, PositionInText>, ListStatement, PositionInText> nonLabeledListStatement() {
        return (Parser) spacePadded(
                and(
                        and(literal("$"), or(literal("c"), literal("v"), literal("d"))),
                        list(nonSpace("$.")),
                        literal("$.")
                )
        )
                .map((list, pos) -> ListStatement.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .type(ListStatementType.fromString(((List<String>) ((List<Object>) list).get(0)).get(1)))
                        .symbols(((List<String>) ((List<Object>) list).get(1)))
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, ListStatement, PositionInText> labeledListStatement() {
        return (Parser) spacePadded(
                and(
                        nonSpace(KEYWORDS),
                        space(),
                        and(literal("$"), or(literal("f"), literal("e"), literal("a"))),
                        list(nonSpace("$.")),
                        literal("$.")
                )
        )
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
        return (Parser) spacePadded(
                and(
                        nonSpace(KEYWORDS),
                        space(),
                        literal("$p"),
                        list(nonSpace("$=")),
                        literal("$="),
                        list(nonSpace("$.")),
                        literal("$.")
                )
        )
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
                sb -> sb.toString(),
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
                        return -1;
                    }
                },
                sb -> sb.toString(),
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
