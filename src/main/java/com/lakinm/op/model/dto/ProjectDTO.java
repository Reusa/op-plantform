package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProjectDTO implements Serializable {

    private String id;

    private String name;

    private String description;

    private String projectAdmin;

    private Long updateTime;

    private String status;

}
