package com.lakinm.op.model.entity;

public class SumStatisticsWithBLOBs extends SumStatistics {
    private String planRunWeekTop;

    private String caseFailWeekTop;

    public String getPlanRunWeekTop() {
        return planRunWeekTop;
    }

    public void setPlanRunWeekTop(String planRunWeekTop) {
        this.planRunWeekTop = planRunWeekTop == null ? null : planRunWeekTop.trim();
    }

    public String getCaseFailWeekTop() {
        return caseFailWeekTop;
    }

    public void setCaseFailWeekTop(String caseFailWeekTop) {
        this.caseFailWeekTop = caseFailWeekTop == null ? null : caseFailWeekTop.trim();
    }
}