package com.lakinm.op.model.entity;

public class ReportCollectionCaseWeb {
    private String id;

    private String reportCollectionCaseId;

    private Integer caseWebIndex;

    private String operationId;

    private String operationName;

    private String status;

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

    public Integer getCaseWebIndex() {
        return caseWebIndex;
    }

    public void setCaseWebIndex(Integer caseWebIndex) {
        this.caseWebIndex = caseWebIndex;
    }

    public String getOperationId() {
        return operationId;
    }

    public void setOperationId(String operationId) {
        this.operationId = operationId == null ? null : operationId.trim();
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName == null ? null : operationName.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}