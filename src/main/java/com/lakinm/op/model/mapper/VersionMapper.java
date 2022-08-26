package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Version;

import java.util.List;

public interface VersionMapper {

    Version selectVersionByName(String name);

    void insertVersion(Version version);

    void updateVersion(Version version);

    void deleteVersionById(String versionId);

    List<Version> selectVersionList(String projectId, String condition);
}