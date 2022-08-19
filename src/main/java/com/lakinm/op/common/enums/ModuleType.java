package com.lakinm.op.common.enums;

public enum ModuleType {
    API_MODULE("apiModule"),
    PAGE_MODULE("pageModule"),
    CASE_MODULE("caseModule")
    ;

    private final String type;

    ModuleType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type;
    }

    public String getType() {
        return type;
    }
}
