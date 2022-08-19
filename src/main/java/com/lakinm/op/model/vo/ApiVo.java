package com.lakinm.op.model.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;

@Data
//@JsonInclude(value = JsonInclude.Include.NON_NULL)
public class ApiVo implements Serializable {
    private String id;

    private Long num;

    private String name;

    private String level;

    private String projectId;

    private String moduleId;

    private String method;

    private String path;

    private String protocol;

    private String domainSign;

    private String description;

    private String updateUser;

    private Long updateTime;

    private String status;

    private String header;

    private String body;

    private String query;

    private String rest;

    private String moduleName;

    private String username;
}
