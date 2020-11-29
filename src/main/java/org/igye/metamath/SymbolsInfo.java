package org.igye.metamath;

import lombok.Data;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Data
public class SymbolsInfo {
    private Set<String> constants = new HashSet<>();
    private Map<String, ListStatement> varTypes = new HashMap<>();
}
