package org.igye.metamath;

import org.igye.textparser.Parser;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;

import java.util.List;

import static org.igye.textparser.Parsers.or;
import static org.igye.textparser.Parsers.rep;
import static org.igye.textparser.TextParsers.charSeq;
import static org.igye.textparser.TextParsers.spacePadded;

public class MetamathParsers {
    public static Parser<TokenStream<Character, PositionInText>, Preprocessed, PositionInText> preprocessed() {
        return (Parser) rep(spacePadded(or(comment(), nonComment())))
                .map(parts -> {
                    final Preprocessed preprocessed = new Preprocessed();
                    for (Object part : (List<Object>) parts) {
                        if (part instanceof NonComment) {
                            preprocessed.getCode().add((NonComment) part);
                        } else {
                            preprocessed.getComments().add((Comment) part);
                        }
                    }
                    return preprocessed;
                });
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
