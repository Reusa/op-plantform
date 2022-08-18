package com.lakinm.op.common.exception;

public class DataBlankException extends RuntimeException{

    public DataBlankException(String message) {
        super(message);
    }

    private DataBlankException(Throwable t) {
        super(t);
    }

    public static DataBlankException getException(String message) {
        throw new DataBlankException(message);
    }

    public static void throwException(String message) {
        throw new DataBlankException(message);
    }

    public static void throwException(Throwable t) {
        throw new DataBlankException(t);
    }
}
