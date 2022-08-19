package com.lakinm.op.model.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Module implements Serializable {
    private String id;

    private String name;

    private String parentId;

    private String projectId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;
}
