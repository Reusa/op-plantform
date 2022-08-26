package com.lakinm.op.common.enums;

public enum PlanFrequencyType {
    ONLY_ONE("ONLY_ONE"),
    HALF_HOUR("HALF_HOUR"),
    EVERY_HOUR("EVERY_HOUR"),
    HALF_DAY("HALF_DAY"),
    EVERY_DAY("EVERY_DAY"),
    EVERY_WEEK("EVERY_WEEK"),
    EVERY_MONTH("EVERY_MONTH")
    ;

    private final String type;

    PlanFrequencyType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
