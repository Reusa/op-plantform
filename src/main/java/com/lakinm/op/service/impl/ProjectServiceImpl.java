package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.ProjectDTO;
import com.lakinm.op.model.mapper.ProjectMapper;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public Result getUserProjects(String userId) {
        List<ProjectDTO> projectDTOS = projectMapper.findUserProjectsByUserId(userId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), projectDTOS);
    }
}
