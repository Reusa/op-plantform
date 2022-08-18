package com.lakinm.op.common.enums;

public enum EngineType {
    SYSTEM("system"),
    CUSTOM("custom")
    ;

    private final String value;
    EngineType(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.value;
    }

}
