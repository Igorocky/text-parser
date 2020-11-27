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

    private final String shortName;

    ListStatementType(String shortName) {
        this.shortName = shortName;
    }

    public static ListStatementType fromString(String name) {
        for (ListStatementType value : values()) {
            if (value.shortName.equals(name)) {
                return value;
            }
        }
        throw new ParserException("Cannot find ListStatementType by name '" + name + "'");
    }

    public String getShortName() {
        return shortName;
    }
}
