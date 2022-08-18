package com.lakinm.op.service.impl;

import com.lakinm.op.model.dto.TaskDTO;
import com.lakinm.op.model.mapper.TaskMapper;
import com.lakinm.op.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Override
    public List<TaskDTO> getTaskListByEngineId(String id) {
        return taskMapper.getTaskListByEngineId(id);
    }
}
