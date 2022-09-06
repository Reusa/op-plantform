package com.lakinm.op.common.enums;

public enum ReportSourceType {
    // 用来区分执行数据从哪儿取
    PLAN("plan"),
    COLLECTION("collection"),
    CASE("case"),
    TEMP("temp"); // 调试任务 从debug_data临时表取
    ;

    private final String type;

    ReportSourceType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }
}
