package com.lakinm.op.service;

import com.lakinm.op.response.Result;

public interface ProjectService {
    Result getUserProjects(String userId);

    Result addUserProject(String userId, String projectId);
}
