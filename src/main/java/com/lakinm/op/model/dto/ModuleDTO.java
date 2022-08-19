package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ModuleDTO implements Serializable {
    private String id;

    private String name;

    private String parentId;

    private String projectId;

    private String createUser;

    private Long createTime;

    private String label;

    private List<ModuleDTO> children;
}
