package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PlanRequest implements Serializable {
    private String id;

    private String name;

    private String versionId;

    private String description;

    private String environmentId;

    private String retry;

    private String engineId;

    private String projectId;

    private String startTime;

    // 执行频率
    private String frequency;

    private List<CollectionRequest> collections;
}
