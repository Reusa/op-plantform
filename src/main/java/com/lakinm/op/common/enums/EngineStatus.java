package com.lakinm.op.common.enums;

public enum EngineStatus {
    OFFLINE("offline"),
    ONLINE("online"),
    RUNNING("running")
    ;

    private final String value;
    EngineStatus(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.value;
    }
}
