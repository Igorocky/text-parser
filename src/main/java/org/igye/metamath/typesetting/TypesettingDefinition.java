package org.igye.metamath.typesetting;

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
public class TypesettingDefinition {
    private PositionInText begin;
    private PositionInText end;
    private String type;
    private List<TypesettingArg> args;
}
