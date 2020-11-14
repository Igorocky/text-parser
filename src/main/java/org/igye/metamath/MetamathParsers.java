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

import static org.igye.textparser.Parsers.or;
import static org.igye.textparser.Parsers.stream;
import static org.igye.textparser.TextParsers.charSeq;
import static org.igye.textparser.TextParsers.spacePadded;

public class MetamathParsers {
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

    public static Parser<TokenStream<Character, PositionInText>,Comment,PositionInText> comment() {
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

    public static Parser<TokenStream<Character, PositionInText>,NonComment,PositionInText> nonComment() {
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
