package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class ElementRequest implements Serializable {
    private String id;

    private Long num;

    private String name;

    private String moduleId;

    private String projectId;

    private String by;

    private String expression;

    private String description;
}
