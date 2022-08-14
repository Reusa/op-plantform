package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ProjectDTO;
import com.lakinm.op.model.entity.Project;

import java.util.List;

public interface ProjectMapper {

    List<ProjectDTO> findUserProjectsByUserId(String userId);

}