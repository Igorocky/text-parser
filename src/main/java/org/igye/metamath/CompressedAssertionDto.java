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
public class CompressedAssertionDto {
    private List<String> s;
    private String t;
    private String n;
    private String d;
    private Map<Integer,Integer> v;
    private CompressedStackNodeDto a;
    private List<CompressedStackNodeDto> p;
}
