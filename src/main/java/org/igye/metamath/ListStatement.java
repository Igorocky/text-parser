package org.igye.metamath;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.igye.textparser.PositionInText;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ListStatement {
    private PositionInText begin;
    private PositionInText end;
    private ListStatementType type;
    private String label;
    private List<String> symbols;
    private List<String> proof;
}
