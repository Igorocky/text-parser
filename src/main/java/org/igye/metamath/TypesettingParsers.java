package org.igye.metamath;

import lombok.Data;
import org.igye.textparser.Parser;
import org.igye.textparser.PositionInText;
import org.igye.textparser.TokenStream;

import static org.igye.textparser.TextParsers.charSeq;

public class TypesettingParsers {

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

    private static Parser<TokenStream<Character, PositionInText>,Comment,PositionInText> typesettingComment() {
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
        private boolean prevCharWasQuotation;

        public QuotedStringCtx(char quotationChar) {
            this.quotationChar = quotationChar;
        }

        public int consume(char ch, boolean isLast) {
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
                        consumedLength++;
                        content.append(ch);
                        return -1;
                    }
                }
            }
        }
    }
}
