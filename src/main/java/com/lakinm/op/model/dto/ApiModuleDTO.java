package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ApiModuleDTO implements Serializable {
    private String id;

    private String name;

    private String parentId;

    private String projectId;

    private String createUser;

    private Long createTime;

    private String label;

    private List<ApiModuleDTO> children;
}
