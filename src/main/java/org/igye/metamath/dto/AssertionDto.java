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
public class AssertionDto {
    private String type;
    private String name;
    private String description;
    private Map<String,String> varTypes;
    private List<List<String>> params;
    private List<String> retVal;
    private List<StackNodeDto> proof;
}
