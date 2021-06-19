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
public class CompressedStackNodeDto {
    private Integer i;
    private List<Integer> a;
    private Integer t;
    private Integer l;
    private List<List<Integer>> p;
    private Integer n;
    private List<Integer> r;
    private Map<Integer,List<Integer>> s;
    private List<Integer> e;
}
