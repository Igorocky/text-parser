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
public class ProofDto {
    private List<StackNodeDto> nodes;
    private Map<String,String> varTypes;
}
