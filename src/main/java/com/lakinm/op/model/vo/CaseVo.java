package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class CaseVo implements Serializable {
    private String id;

    private Long num;

    private String name;

    private String level;

    private String moduleId;

    private String projectId;

    private String type;

    private String description;

    private String createUser;

    private Long updateTime;

    private String status;

    private String username;
}
