package org.igye.metamath.dto;

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
public class IndexElemDto {
    private int id;
    private String type;
    private String label;
    private List<List<String>> hypotheses;
    private List<String> expression;
    private Map<String,String> varTypes;
}
