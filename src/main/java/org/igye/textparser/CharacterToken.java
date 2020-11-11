package org.igye.textparser;

import lombok.Value;

@Value
public class CharacterToken implements Token<Character, PositionInText> {
    private Character value;
    private PositionInText position;

    @Override
    public Character value() {
        return value;
    }

    @Override
    public PositionInText position() {
        return position;
    }
}
