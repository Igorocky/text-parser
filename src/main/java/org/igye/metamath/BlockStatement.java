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
public class BlockStatement implements Statement {
    private PositionInText begin;
    private PositionInText end;
    private List<Statement> content;
}
