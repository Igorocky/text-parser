package org.igye.metamath.typesetting;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.igye.textparser.PositionInText;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TypesettingData implements TypesettingArg {
    private PositionInText begin;
    private PositionInText end;
    private String text;
}
