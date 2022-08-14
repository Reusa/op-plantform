package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.entity.ParamData;
import com.lakinm.op.model.entity.ParamGroup;
import com.lakinm.op.model.mapper.CommonParamMapper;
import com.lakinm.op.model.vo.ParamDataVo;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.ParamDataRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CommonParamService;
import com.lakinm.op.service.UserService;
import com.qiniu.util.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
public class CommonParamServiceImpl implements CommonParamService {

    @Autowired
    private CommonParamMapper commonParamMapper;

    @Autowired
    private UserService userService;

    @Override
    public List<ParamGroup> getParamGroupList(QueryRequest queryRequest) {
        String projectId = queryRequest.getProjectId();
        return commonParamMapper.findParamGroupByPid(projectId);
    }

    @Override
    public void addParamGroup(ParamGroup paramGroup, String token) {
        String userId = getUserIdByToken(token);
        paramGroup.setId(UUID.randomUUID().toString());
        paramGroup.setCreateUser(userId);
        paramGroup.setUpdateUser(userId);
        paramGroup.setCreateTime(System.currentTimeMillis());
        paramGroup.setUpdateTime(System.currentTimeMillis());
        commonParamMapper.saveParamGroup(paramGroup);
    }

    @Override
    public void deleteParamGroup(String id) {
        commonParamMapper.deleteParamGroupById(id);
    }

    @Override
    public Result addParamData(String token, ParamDataRequest request) {
        ParamData oldParamData = commonParamMapper.findParamDataByGroupIdAndName(request.getGroupId(), request.getName());
        if (oldParamData != null && !Objects.equals(oldParamData.getId(), request.getId())) {
            return Result.fail(ResultEnum.SAME_PARAM_NAME.getCode(), ResultEnum.SAME_PARAM_NAME.getMessage());
        }
        String userId = getUserIdByToken(token);
        ParamData paramData = new ParamData();
        BeanUtils.copyProperties(request, paramData);
        paramData.setCreateUser(userId);
        paramData.setUpdateUser(userId);
        paramData.setCreateTime(System.currentTimeMillis());
        paramData.setUpdateTime(System.currentTimeMillis());
        if (StringUtils.isNullOrEmpty(request.getId())) {
            paramData.setId(UUID.randomUUID().toString());
            commonParamMapper.saveParamData(paramData);
        } else {
            ParamData dataBaseParam = commonParamMapper.selectPatamDataById(request.getId());
            if (dataBaseParam != null) {
                commonParamMapper.updateParamData(paramData);
            }
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public List<ParamDataVo> getParamData(QueryRequest queryRequest) {
        String groupId = queryRequest.getParamGroupId();
        List<ParamData> paramDataList = commonParamMapper.findParamDataByGroupId(groupId);
        List<ParamDataVo> paramDataVos = new ArrayList<>();
        for (ParamData paramData : paramDataList) {
            ParamDataVo paramDataVo = new ParamDataVo();
            paramDataVo.setId(paramData.getId());
            paramDataVo.setName(paramData.getName());
            paramDataVo.setParamData(paramData.getParamData());
            paramDataVo.setDataType(paramData.getDataType());
            paramDataVo.setDescription(paramData.getDescription());
            paramDataVo.setGroupId(paramData.getGroupId());
            paramDataVo.setCreateUser(paramData.getCreateUser());
            paramDataVo.setUpdateUser(paramData.getUpdateUser());
            paramDataVo.setCreateTime(paramData.getCreateTime());
            paramDataVos.add(paramDataVo);
        }
        return paramDataVos;
    }

    @Override
    public void deleteParamData(String paramDataId) {
        commonParamMapper.deleteParamDataById(paramDataId);
    }

    public String getUserIdByToken(String token) {
        UserVo userVo = userService.checkToken(token);
        String userId = userVo.getId();
        return userId;
    }
}
