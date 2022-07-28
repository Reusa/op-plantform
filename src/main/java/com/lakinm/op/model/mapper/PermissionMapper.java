package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Permission;

import java.util.List;

public interface PermissionMapper {

    List<String> findUserProjectPermission(String userId, String projectId);
}