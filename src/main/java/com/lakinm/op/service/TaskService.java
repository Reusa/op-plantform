package com.lakinm.op.service;

import com.lakinm.op.model.dto.TaskDTO;

import java.util.List;

public interface TaskService {
    List<TaskDTO> getTaskListByEngineId(String id);
}
