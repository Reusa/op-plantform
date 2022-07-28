package com.lakinm.op.model.entity;

public class DailyStatistics extends DailyStatisticsKey {
    private String id;

    private Integer apiCaseNew;

    private Integer webCaseNew;

    private Integer apiCaseSum;

    private Integer webCaseSum;

    private Integer apiCaseRun;

    private Integer webCaseRun;

    private Float apiCasePassRate;

    private Float webCasePassRate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getApiCaseNew() {
        return apiCaseNew;
    }

    public void setApiCaseNew(Integer apiCaseNew) {
        this.apiCaseNew = apiCaseNew;
    }

    public Integer getWebCaseNew() {
        return webCaseNew;
    }

    public void setWebCaseNew(Integer webCaseNew) {
        this.webCaseNew = webCaseNew;
    }

    public Integer getApiCaseSum() {
        return apiCaseSum;
    }

    public void setApiCaseSum(Integer apiCaseSum) {
        this.apiCaseSum = apiCaseSum;
    }

    public Integer getWebCaseSum() {
        return webCaseSum;
    }

    public void setWebCaseSum(Integer webCaseSum) {
        this.webCaseSum = webCaseSum;
    }

    public Integer getApiCaseRun() {
        return apiCaseRun;
    }

    public void setApiCaseRun(Integer apiCaseRun) {
        this.apiCaseRun = apiCaseRun;
    }

    public Integer getWebCaseRun() {
        return webCaseRun;
    }

    public void setWebCaseRun(Integer webCaseRun) {
        this.webCaseRun = webCaseRun;
    }

    public Float getApiCasePassRate() {
        return apiCasePassRate;
    }

    public void setApiCasePassRate(Float apiCasePassRate) {
        this.apiCasePassRate = apiCasePassRate;
    }

    public Float getWebCasePassRate() {
        return webCasePassRate;
    }

    public void setWebCasePassRate(Float webCasePassRate) {
        this.webCasePassRate = webCasePassRate;
    }
}