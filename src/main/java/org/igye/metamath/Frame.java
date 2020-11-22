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
public class Frame {
    private List<ListStatement> types;
    private List<ListStatement> hypothesis;
    private ListStatement assertion;
}
