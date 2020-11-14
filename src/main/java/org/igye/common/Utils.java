package org.igye.common;

import java.io.InputStream;

public class Utils {
    public static InputStream inputStreamFromClasspath(String path) {
        return Utils.class.getResourceAsStream(path);
    }
}
