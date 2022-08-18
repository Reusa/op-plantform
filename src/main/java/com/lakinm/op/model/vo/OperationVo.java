package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class OperationVo implements Serializable {

    private String id;

    private String name;

    private String type;

    private String from;

    private String element;

    private String data;

    private String code;

    private String description;

    private String projectId;

    private String createUser;

    private Long updateTime;

    private String username;
}
