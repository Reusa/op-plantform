package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class CollectionCaseVo implements Serializable {
    private String id;

    private Integer index;

    private String collectionId;

    private String caseId;

    private String caseType;

    private String caseName;

    private String caseModule;
}
