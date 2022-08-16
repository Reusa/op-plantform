package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class FunctionDTO implements Serializable {

    private String id;

    private String name;

    private String from;

    private String param;

    private String code;

    private String expression;

    private String description;

    private String projectId;

    private String createUser;

    private Long updateTime;

    private String username;
}
