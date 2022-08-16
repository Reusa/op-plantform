package com.lakinm.op.model.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

@Data
public class FunctionVo implements Serializable {
    private String id;

    private String name;

    private String from;

    private String param;

    private String code;

    private String expression;

    private String description;

    private String projectId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    private String username;

}
