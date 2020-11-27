package org.igye.metamath;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StackNodeDto {
    private int id;
    private List<Integer> args;
    private String type;
    private String label;
    private List<List<String>> params;
    private List<String> retVal;
    private Map<String,List<String>> substitution;
    private List<String> expr;
}
