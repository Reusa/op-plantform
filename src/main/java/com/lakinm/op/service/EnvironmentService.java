package com.lakinm.op.service;

import com.lakinm.op.model.dto.EnvironmentDTO;
import com.lakinm.op.model.entity.Environment;
import com.lakinm.op.model.vo.EnvironmentVo;
import com.lakinm.op.request.EnvironmentRequest;

import java.util.List;

public interface EnvironmentService {
    void addEnvironment(String token, EnvironmentRequest request);

    void deleteEnvironment(String id);

    List<Environment> getAllEnvironment(String projectId);

    List<EnvironmentVo> getEnvironmentList(String projectId, String condition);
}
