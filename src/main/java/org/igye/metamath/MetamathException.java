package org.igye.metamath;

public class MetamathException extends RuntimeException {
    public MetamathException(String message) {
        super(message);
    }

    public MetamathException(Throwable cause) {
        super(cause);
    }
}
