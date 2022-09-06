package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ReportCollectionCaseTransDTO implements Serializable {
    private String status;

    private String transId;

    private String transName;

    private String content;

    private String execLog;

    private String during;

    private String screenshotList;

    private Boolean showViewer = false;
}
