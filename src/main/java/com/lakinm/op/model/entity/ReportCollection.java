package com.lakinm.op.model.entity;

public class ReportCollection {
    private String id;

    private String reportId;

    private String collectionId;

    private String collectionName;

    private String collectionVersion;

    private Integer caseTotal;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId == null ? null : reportId.trim();
    }

    public String getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId == null ? null : collectionId.trim();
    }

    public String getCollectionName() {
        return collectionName;
    }

    public void setCollectionName(String collectionName) {
        this.collectionName = collectionName == null ? null : collectionName.trim();
    }

    public String getCollectionVersion() {
        return collectionVersion;
    }

    public void setCollectionVersion(String collectionVersion) {
        this.collectionVersion = collectionVersion == null ? null : collectionVersion.trim();
    }

    public Integer getCaseTotal() {
        return caseTotal;
    }

    public void setCaseTotal(Integer caseTotal) {
        this.caseTotal = caseTotal;
    }
}