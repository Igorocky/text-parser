package org.igye.metamath.typesetting;

import lombok.Data;
import org.igye.metamath.Comment;
import org.igye.textparser.Parser;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;

import java.util.List;
import java.util.stream.Collectors;

import static org.igye.textparser.Parsers.and;
import static org.igye.textparser.Parsers.or;
import static org.igye.textparser.Parsers.withName;
import static org.igye.textparser.TextParsers.charSeq;
import static org.igye.textparser.TextParsers.list;
import static org.igye.textparser.TextParsers.literal;
import static org.igye.textparser.TextParsers.nonEmptyList;
import static org.igye.textparser.TextParsers.nonSpace;
import static org.igye.textparser.TextParsers.spacePadded;

public class TypesettingParsers {

    protected static Parser<TokenStream<Character, PositionInText>, TypesettingDefinition, PositionInText> typesettingDefinition() {
        return and(
                nonSpace(";"),
                list(or(typesettingData(), typesettingKeyword())),
                spacePadded(literal(";"))
        )
                .map((list, pos) -> TypesettingDefinition.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .type((String) list.get(0))
                        .args((List<TypesettingArg>) list.get(1))
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, TypesettingKeyword, PositionInText> typesettingKeyword() {
        return nonSpace(";")
                .map((str, pos) -> TypesettingKeyword.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .text(str)
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>, TypesettingData, PositionInText> typesettingData() {
        return (Parser) withName("typesettingData", nonEmptyList(
                or(quotedString('\''), quotedString('"')),
                literal("+")
        ))
                .map((list, pos) -> TypesettingData.builder()
                        .begin(((PositionInText) pos.getStart()))
                        .end(((PositionInText) pos.getEnd()))
                        .text(
                                ((List<QuotedString>) list).stream().map(QuotedString::getText).collect(Collectors.joining())
                        )
                        .build()
                );
    }

    protected static Parser<TokenStream<Character, PositionInText>,QuotedString,PositionInText> quotedString(char quotationChar) {
        return charSeq(
                "Metamath quoted string",
                () -> new QuotedStringCtx(quotationChar),
                (ctx,ch,isLast) -> ctx.consume(ch, isLast),
                (ctx,len) -> ctx.getContent().toString(),
                "A Metamath quoted string was expected"
        ).map((str,pos) ->
                QuotedString.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .text(str)
                        .build()
        );
    }

    private static Parser<TokenStream<Character, PositionInText>, Comment,PositionInText> typesettingComment() {
        return charSeq(
                "Metamath typesetting comment",
                () -> new StringBuilder(),
                (sb,ch,isLast) -> {
                    if (sb.length() == 0) {
                        if (ch == '/') {
                            sb.append(ch);
                            return -1;
                        } else {
                            return 0;
                        }
                    } else if (sb.length() == 1) {
                        if (ch == '*') {
                            sb.append(ch);
                            return -1;
                        } else {
                            return 0;
                        }
                    } else if (ch == '/' && sb.charAt(sb.length()-1) == '*') {
                        sb.append(ch);
                        return sb.length();
                    } else {
                        sb.append(ch);
                        return -1;
                    }
                },
                (sb,len) -> sb.delete(len-1,sb.length()).toString(),
                "A Metamath typesetting comment was expected"
        ).map((str,pos) ->
                Comment.builder()
                        .begin(pos.getStart())
                        .end(pos.getEnd())
                        .text(str.substring(2,str.length()-2))
                        .build()
        );
    }

    @Data
    private static class QuotedStringCtx {
        private char quotationChar;
        private StringBuilder content = new StringBuilder();
        private int consumedLength = 0;
        private boolean prevCharWasQuotation = false;

        public QuotedStringCtx(char quotationChar) {
            this.quotationChar = quotationChar;
        }

        public int consume(char ch, boolean isLast) {
            if (consumedLength == 0 && ch != quotationChar) {
                return 0;
            }
            if (isLast) {
                if (ch == quotationChar) {
                    if (prevCharWasQuotation) {
                        if (consumedLength == 1) {
                            return 2;
                        } else {
                            return 0;
                        }
                    } else {
                        if (consumedLength >= 1) {
                            return consumedLength+1;
                        } else {
                            return 0;
                        }
                    }
                } else {
                    if (prevCharWasQuotation) {
                        if (consumedLength >= 2) {
                            return consumedLength;
                        } else {
                            return 0;
                        }
                    } else {
                        return 0;
                    }
                }
            } else {
                if (ch == quotationChar) {
                    if (prevCharWasQuotation) {
                        consumedLength++;
                        content.append(quotationChar);
                        prevCharWasQuotation = false;
                        return -1;
                    } else {
                        consumedLength++;
                        prevCharWasQuotation = true;
                        return -1;
                    }
                } else {
                    if (prevCharWasQuotation) {
                        if (consumedLength == 1) {
                            consumedLength++;
                            content.append(ch);
                            prevCharWasQuotation = false;
                            return -1;
                        } else {
                            return consumedLength;
                        }
                    } else {
                        if (consumedLength == 0) {
                            return 0;
                        } else {
                            consumedLength++;
                            content.append(ch);
                            return -1;
                        }
                    }
                }
            }
        }
    }
}
