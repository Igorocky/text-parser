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
public class CompressedIndexElemDto {
    private int i;
    private int t;
    private String l;
    private List<List<Integer>> h;
    private List<Integer> e;
    private Map<Integer,Integer> v;
}
