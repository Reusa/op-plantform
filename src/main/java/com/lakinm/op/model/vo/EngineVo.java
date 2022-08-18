package com.lakinm.op.model.vo;

import com.lakinm.op.model.dto.TaskDTO;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class EngineVo implements Serializable {
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
