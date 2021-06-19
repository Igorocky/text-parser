package org.igye.metamath.dto;

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
    private String pa;
    private String r;
    private List<String> p;
}
