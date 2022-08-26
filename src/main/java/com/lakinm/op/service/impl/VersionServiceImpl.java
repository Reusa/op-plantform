package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.entity.Version;
import com.lakinm.op.model.mapper.VersionMapper;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.UserService;
import com.lakinm.op.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class VersionServiceImpl implements VersionService {

    @Autowired
    private UserService userService;

    @Autowired
    private VersionMapper versionMapper;

    @Override
    public Result addVersion(String token, Version version) {
//        String userId = userService.checkToken(token).getId();
        Version oldVersion = versionMapper.selectVersionByName(version.getName());
        if (oldVersion != null && version.getName().equals(oldVersion.getName())) {
            Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage());
        }
        if (version.getId() == null || version.getId().equals("")) {
            version.setId(UUID.randomUUID().toString());
            version.setCreateTime(System.currentTimeMillis());
            version.setUpdateTime(System.currentTimeMillis());
            versionMapper.insertVersion(version);
        } else {
            version.setUpdateTime(System.currentTimeMillis());
            versionMapper.updateVersion(version);
        }
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), version);
    }

    @Override
    public Result deleteVersion(String versionId) {
        versionMapper.deleteVersionById(versionId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public List<Version> getProjectVersionList(String projectId, String condition) {
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        } else {
            condition = null;
        }
        return versionMapper.selectVersionList(projectId, condition);
    }
}
