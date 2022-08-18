package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.EnvironmentDTO;
import com.lakinm.op.model.entity.Environment;

import java.util.List;

public interface EnvironmentMapper {
    Environment findEnvByName(String projectId, String name);

    void insertEnvironment(Environment env);

    void updateEnvironmentById(Environment env);

    void deleteEnvById(String id);

    List<Environment> findEnvByProjectId(String projectId);

    List<EnvironmentDTO> findEnvByCondition(String projectId, String condition);
}