package org.igye.metamath;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CompressedAssertionDto2 {
    private String s;
    private String t;
    private String n;
    private String d;
    private String v;
    private CompressedStackNodeDto2 a;
    private List<CompressedStackNodeDto2> p;
}