package com.lakinm.op.model.entity;

public class SumStatistics {
    private String projectId;

    private String id;

    private Integer apiCaseTotal;

    private Integer apiCaseNewWeek;

    private Integer webCaseTotal;

    private Integer webCaseNewWeek;

    private Integer planRunTotal;

    private Integer planRunToday;

    private Integer caseRunTotal;

    private Integer caseRunToday;

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getApiCaseTotal() {
        return apiCaseTotal;
    }

    public void setApiCaseTotal(Integer apiCaseTotal) {
        this.apiCaseTotal = apiCaseTotal;
    }

    public Integer getApiCaseNewWeek() {
        return apiCaseNewWeek;
    }

    public void setApiCaseNewWeek(Integer apiCaseNewWeek) {
        this.apiCaseNewWeek = apiCaseNewWeek;
    }

    public Integer getWebCaseTotal() {
        return webCaseTotal;
    }

    public void setWebCaseTotal(Integer webCaseTotal) {
        this.webCaseTotal = webCaseTotal;
    }

    public Integer getWebCaseNewWeek() {
        return webCaseNewWeek;
    }

    public void setWebCaseNewWeek(Integer webCaseNewWeek) {
        this.webCaseNewWeek = webCaseNewWeek;
    }

    public Integer getPlanRunTotal() {
        return planRunTotal;
    }

    public void setPlanRunTotal(Integer planRunTotal) {
        this.planRunTotal = planRunTotal;
    }

    public Integer getPlanRunToday() {
        return planRunToday;
    }

    public void setPlanRunToday(Integer planRunToday) {
        this.planRunToday = planRunToday;
    }

    public Integer getCaseRunTotal() {
        return caseRunTotal;
    }

    public void setCaseRunTotal(Integer caseRunTotal) {
        this.caseRunTotal = caseRunTotal;
    }

    public Integer getCaseRunToday() {
        return caseRunToday;
    }

    public void setCaseRunToday(Integer caseRunToday) {
        this.caseRunToday = caseRunToday;
    }
}