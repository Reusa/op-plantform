package com.lakinm.op.model.entity;

public class ReportCollectionCaseApi {
    private String id;

    private String reportCollectionCaseId;

    private Integer caseApiIndex;

    private String apiId;

    private String apiName;

    private String apiPath;

    private Integer during;

    private String status;

    private String execLog;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getReportCollectionCaseId() {
        return reportCollectionCaseId;
    }

    public void setReportCollectionCaseId(String reportCollectionCaseId) {
        this.reportCollectionCaseId = reportCollectionCaseId == null ? null : reportCollectionCaseId.trim();
    }

    public Integer getCaseApiIndex() {
        return caseApiIndex;
    }

    public void setCaseApiIndex(Integer caseApiIndex) {
        this.caseApiIndex = caseApiIndex;
    }

    public String getApiId() {
        return apiId;
    }

    public void setApiId(String apiId) {
        this.apiId = apiId == null ? null : apiId.trim();
    }

    public String getApiName() {
        return apiName;
    }

    public void setApiName(String apiName) {
        this.apiName = apiName == null ? null : apiName.trim();
    }

    public String getApiPath() {
        return apiPath;
    }

    public void setApiPath(String apiPath) {
        this.apiPath = apiPath == null ? null : apiPath.trim();
    }

    public Integer getDuring() {
        return during;
    }

    public void setDuring(Integer during) {
        this.during = during;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getExecLog() {
        return execLog;
    }

    public void setExecLog(String execLog) {
        this.execLog = execLog == null ? null : execLog.trim();
    }
}