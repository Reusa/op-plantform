package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class PlanVo implements Serializable {

    private String id;

    private String name;

    private String versionId;

    private String versionName;

    private String description;

    private String environmentId;

    private String environmentName;

    private String retry;

    private String frequency;

    private String createUser;

    private String username;

    private Long updateTime;
}
