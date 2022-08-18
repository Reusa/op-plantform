package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class EnvironmentRequest implements Serializable {
    private String id;

    private String name;

    private String description;

    private String projectId;
}
