package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class TestFileDTO implements Serializable {

    private String id;

    private String name;

    private String filePath;

    private String description;

    private String projectId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    private String username;
}
