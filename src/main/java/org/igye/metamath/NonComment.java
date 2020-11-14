package org.igye.metamath;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.igye.textparser.PositionInText;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NonComment {
    private PositionInText begin;
    private PositionInText end;
    private String text;
}
