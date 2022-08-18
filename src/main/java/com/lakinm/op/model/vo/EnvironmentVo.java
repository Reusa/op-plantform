package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class EnvironmentVo implements Serializable {
    private String id;

    private String name;

    private String description;

    private String projectId;

    private String username;

    private Long updateTime;
}
