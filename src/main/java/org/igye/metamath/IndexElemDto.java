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
public class IndexElemDto {
    private int id;
    private String type;
    private String label;
    private List<String> expression;
}
