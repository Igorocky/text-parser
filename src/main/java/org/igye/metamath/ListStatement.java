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
public class ListStatement implements Statement {
    private PositionInText begin;
    private PositionInText end;
    private Statement prevStatement;
    private BlockStatement currBlock;
    private ListStatementType type;
    private String label;
    private List<String> symbols;
    private List<String> proof;
    private CompressedProof compressedProof;
    private Frame frame;
    private String description;
}
