package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class EngineRequest implements Serializable {
    private String name;

    private String projectId;
}
