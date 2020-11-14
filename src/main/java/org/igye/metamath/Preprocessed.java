package org.igye.metamath;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Preprocessed {
    private List<Comment> comments = new ArrayList<>();
    private List<NonComment> code = new ArrayList<>();
}
