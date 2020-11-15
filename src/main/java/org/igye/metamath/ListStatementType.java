package org.igye.metamath;

import org.igye.textparser.ParserException;

public enum ListStatementType {
    CONSTANT("c"),
    VARIABLE("v"),
    DISJOINT("d"),
    FLOATING("f"),
    ESSENTIAL("e"),
    AXIOM("a"),
    THEOREM("p");

    private final String name;

    ListStatementType(String name) {
        this.name = name;
    }

    public static ListStatementType fromString(String name) {
        for (ListStatementType value : values()) {
            if (value.name.equals(name)) {
                return value;
            }
        }
        throw new ParserException("Cannot find ListStatementType by name '" + name + "'");
    }
}
