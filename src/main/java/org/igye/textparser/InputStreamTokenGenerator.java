package org.igye.textparser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.function.Supplier;

public class InputStreamTokenGenerator implements Supplier<Token<Character, PositionInText>[]> {
    private static final int CHAR_BUFFER_LENGTH = 1024*10;

    private BufferedReader bufferedReader;
    private int lineNum = 0;
    private int colNum = 0;

    public InputStreamTokenGenerator(InputStream inputStream) {
        bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
    }

    @Override
    public Token<Character, PositionInText>[] get() {
        if (bufferedReader == null) {
            return null;
        } else {
            char[] cbuf = new char[CHAR_BUFFER_LENGTH];
            try {
                final int read = bufferedReader.read(cbuf, 0, CHAR_BUFFER_LENGTH);
                if (read <= 0) {
                    bufferedReader.close();
                    bufferedReader = null;
                    return null;
                } else {
                    final Token[] result = new Token[read];
                    for (int i = 0; i < read; i++) {
                        result[i] = new CharacterToken(cbuf[i],new PositionInText(lineNum, colNum));
                        if (cbuf[i] == '\n') {
                            lineNum++;
                            colNum=0;
                        } else {
                            colNum++;
                        }
                    }
                    return result;
                }
            } catch (IOException e) {
                throw new ParserException(e);
            }
        }
    }
}
