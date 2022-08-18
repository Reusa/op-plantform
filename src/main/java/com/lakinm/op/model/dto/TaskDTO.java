package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class TaskDTO implements Serializable {

    private String id;

    private String name;

    private String type;

    private String status;

    private String engineId;

    private String projectId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    private String username;

    private String reportId;

    private String sourceType;

    private String sourceId;

    private String environmentId;
}
