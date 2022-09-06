package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.ProjectDTO;
import com.lakinm.op.model.entity.UserProject;
import com.lakinm.op.model.mapper.ProjectMapper;
import com.lakinm.op.model.mapper.UserProjectMapper;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private UserProjectMapper userProjectMapper;

    @Override
    public Result getUserProjects(String userId) {
        List<ProjectDTO> projectDTOS = projectMapper.findUserProjectsByUserId(userId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), projectDTOS);
    }

    @Override
    public Result addUserProject(String userId, String projectId) {
        UserProject userProject = new UserProject();
        userProject.setId(UUID.randomUUID().toString());
        userProject.setProjectId(projectId);
        userProject.setUserId(userId);
        userProject.setCreateTime(System.currentTimeMillis());
        userProject.setUpdateTime(System.currentTimeMillis());
        userProjectMapper.insertUserInProject(userProject);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), userProject);
    }
}
