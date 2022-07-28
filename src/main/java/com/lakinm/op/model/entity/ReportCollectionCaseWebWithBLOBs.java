package com.lakinm.op.model.entity;

public class ReportCollectionCaseWebWithBLOBs extends ReportCollectionCaseWeb {
    private String operationElement;

    private String screenShot;

    private String execLog;

    public String getOperationElement() {
        return operationElement;
    }

    public void setOperationElement(String operationElement) {
        this.operationElement = operationElement == null ? null : operationElement.trim();
    }

    public String getScreenShot() {
        return screenShot;
    }

    public void setScreenShot(String screenShot) {
        this.screenShot = screenShot == null ? null : screenShot.trim();
    }

    public String getExecLog() {
        return execLog;
    }

    public void setExecLog(String execLog) {
        this.execLog = execLog == null ? null : execLog.trim();
    }
}