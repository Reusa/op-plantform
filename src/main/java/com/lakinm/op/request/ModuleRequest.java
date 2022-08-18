package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class ModuleRequest implements Serializable {
    private String id;

    private String name;

    private String parentId;

    private String projectId;
}
