package com.lakinm.op.request;

import com.lakinm.op.model.entity.CollectionCase;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class CollectionRequest implements Serializable {
    private String id;

    private String name;

    private String versionId;

    private String description;

    private String projectId;

    private List<CollectionCase> collectionCases;

    // 计划关联集合时集合的序号
    private Integer index;

}
