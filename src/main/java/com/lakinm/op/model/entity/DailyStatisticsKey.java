package com.lakinm.op.model.entity;

import java.util.Date;

public class DailyStatisticsKey {
    private Date statDate;

    private String projectId;

    public Date getStatDate() {
        return statDate;
    }

    public void setStatDate(Date statDate) {
        this.statDate = statDate;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }
}