package org.igye.textparser;

import org.apache.commons.lang3.tuple.Pair;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

public class StringsTokenGenerator implements Supplier<Token<Character, PositionInText>[]> {
    private final List<Pair<PositionInText,String>> strings;

    public StringsTokenGenerator(List<Pair<PositionInText, String>> strings) {
        this.strings = new ArrayList<>(strings);
    }

    @Override
    public Token<Character, PositionInText>[] get() {
        if (strings.isEmpty()) {
            return null;
        } else {
            int lineNum = strings.get(0).getLeft().getLine();
            int colNum = strings.get(0).getLeft().getCol();
            String str = strings.get(0).getRight();
            strings.remove(0);
            final Token[] result = new Token[str.length()];
            for (int i = 0; i < result.length; i++) {
                final char ch = str.charAt(i);
                result[i] = new CharacterToken(ch, new PositionInText(lineNum, colNum));
                if (ch == '\n') {
                    lineNum++;
                    colNum=0;
                } else {
                    colNum++;
                }
            }
            return result;
        }
    }
}
