package com.lakinm.op.service;

import com.lakinm.op.model.entity.Version;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface VersionService {
    Result addVersion(String token, Version version);

    Result deleteVersion(String versionId);

    List<Version> getProjectVersionList(String projectId, String condition);
}
