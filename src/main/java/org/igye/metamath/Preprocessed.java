package org.igye.metamath;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class Preprocessed {
    private List<Comment> comments;
    private List<NonComment> code;
}
