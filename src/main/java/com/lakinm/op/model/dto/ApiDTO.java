package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ApiDTO implements Serializable {

    private String id;

    private Long num;

    private String name;

    private String level;

    private String moduleId;

    private String projectId;

    private String method;

    private String path;

    private String protocol;

    private String domainSign;

    private String description;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    private String status;

    private String header;

    private String body;

    private String query;

    private String rest;

    private String moduleName;

    private String username;
}
