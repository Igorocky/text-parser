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
public class CompressedStackNodeDto {
    private int i;
    private List<Integer> a;
    private int t;
    private int l;
    private List<List<Integer>> p;
    private int n;
    private List<Integer> r;
    private Map<Integer,List<Integer>> s;
    private List<Integer> e;
}
