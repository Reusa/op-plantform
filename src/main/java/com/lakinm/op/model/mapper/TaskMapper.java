package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.TaskDTO;
import com.lakinm.op.model.entity.Task;

import java.util.List;

public interface TaskMapper {
    List<TaskDTO> getTaskListByEngineId(String id);
}