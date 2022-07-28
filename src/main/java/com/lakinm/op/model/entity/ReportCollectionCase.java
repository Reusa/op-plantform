package com.lakinm.op.model.entity;

public class ReportCollectionCase {
    private String id;

    private String reportCollectionId;

    private Integer collectionCaseIndex;

    private String caseId;

    private String caseType;

    private String caseName;

    private String caseDesc;

    private Integer runTimes;

    private Long startTime;

    private Long endTime;

    private String during;

    private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getReportCollectionId() {
        return reportCollectionId;
    }

    public void setReportCollectionId(String reportCollectionId) {
        this.reportCollectionId = reportCollectionId == null ? null : reportCollectionId.trim();
    }

    public Integer getCollectionCaseIndex() {
        return collectionCaseIndex;
    }

    public void setCollectionCaseIndex(Integer collectionCaseIndex) {
        this.collectionCaseIndex = collectionCaseIndex;
    }

    public String getCaseId() {
        return caseId;
    }

    public void setCaseId(String caseId) {
        this.caseId = caseId == null ? null : caseId.trim();
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType == null ? null : caseType.trim();
    }

    public String getCaseName() {
        return caseName;
    }

    public void setCaseName(String caseName) {
        this.caseName = caseName == null ? null : caseName.trim();
    }

    public String getCaseDesc() {
        return caseDesc;
    }

    public void setCaseDesc(String caseDesc) {
        this.caseDesc = caseDesc == null ? null : caseDesc.trim();
    }

    public Integer getRunTimes() {
        return runTimes;
    }

    public void setRunTimes(Integer runTimes) {
        this.runTimes = runTimes;
    }

    public Long getStartTime() {
        return startTime;
    }

    public void setStartTime(Long startTime) {
        this.startTime = startTime;
    }

    public Long getEndTime() {
        return endTime;
    }

    public void setEndTime(Long endTime) {
        this.endTime = endTime;
    }

    public String getDuring() {
        return during;
    }

    public void setDuring(String during) {
        this.during = during == null ? null : during.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}