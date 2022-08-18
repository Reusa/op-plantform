package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class EngineDTO implements Serializable {
    private String id;

    private String name;

    private String engineType;

    private String secret;

    private String status;

    private Long lastHeartbeatTime;

    private String projectId;

    private String createUser;

    private Long createTime;

    private String username;

    private List<TaskDTO> taskList;
}
