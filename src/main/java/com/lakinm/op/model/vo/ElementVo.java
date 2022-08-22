package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ElementVo implements Serializable {
    private String id;

    private String name;

    private String moduleId;

    private String moduleName;

    private String projectId;

    private String by;

    private String expression;

    private String description;

    private String createUser;

    private String userName;

    private Long updateTime;
}
