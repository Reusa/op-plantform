package com.lakinm.op.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.dto.ApiDTO;
import com.lakinm.op.model.entity.Api;
import com.lakinm.op.model.mapper.ApiMapper;
import com.lakinm.op.model.vo.ApiVo;
import com.lakinm.op.request.ApiRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ApiService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class ApiServiceImpl implements ApiService {

    @Autowired
    private ApiMapper apiMapper;

    @Autowired
    private UserService userService;

    private final String NO_CONTENT = "[]";

    @Override
    public Result addApi(String token, ApiRequest request) {
        String userId = userService.checkToken(token).getId();
        Api oldApi = apiMapper.selectApiByName(request.getName(), request.getProjectId());
        if (oldApi != null && !Objects.equals(oldApi.getId(), request.getId())) {
            return Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage());
        }
        Api saveApi = new Api();
        saveApi.setName(request.getName());
        saveApi.setLevel(request.getLevel());
        saveApi.setModuleId(request.getModuleId());
        saveApi.setProjectId(request.getProjectId());
        saveApi.setMethod(request.getMethod());
        saveApi.setPath(request.getPath());
        saveApi.setProtocol(request.getProtocol());
        saveApi.setDomainSign(request.getDomainSign());
        saveApi.setDescription(request.getDescription());
        saveApi.setHeader(request.getHeader().toJSONString());
        saveApi.setBody(request.getBody().toJSONString());
        saveApi.setQuery(request.getQuery().toJSONString());
        saveApi.setRest(request.getRest().toJSONString());

        if (request.getId() == null || request.getId().equals("")) {
            saveApi.setId(UUID.randomUUID().toString());
            saveApi.setCreateUser(userId);
            saveApi.setCreateTime(System.currentTimeMillis());
            saveApi.setUpdateUser(userId);
            saveApi.setUpdateTime(System.currentTimeMillis());
            saveApi.setStatus("Normal");
            apiMapper.insertApi(saveApi);
        } else {
            saveApi.setUpdateUser(userId);
            saveApi.setUpdateTime(System.currentTimeMillis());
            apiMapper.updateApi(saveApi);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), saveApi);
    }

    @Override
    public Result deleteApi(String id) {
//        apiMapper.deleteApiById(id);
        apiMapper.updateApiToDelStatus(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getApiDetail(String id) {
        ApiDTO apiDTO = apiMapper.selectApiById(id);
        ApiVo apiVo = new ApiVo();
        BeanUtils.copyProperties(apiDTO, apiVo);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), apiDTO);
    }

    @Override
    public Result getApiList(QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String projectId = request.getProjectId();
        String moduleId = request.getModuleId();
        String condition = request.getCondition();
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        List<ApiDTO> apis = apiMapper.selectApiList(projectId, moduleId, condition);
        List<ApiVo> apiVos = new ArrayList<>();
        for (ApiDTO api : apis) {
            ApiVo apiVo = new ApiVo();
            apiVo.setId(api.getId());
            apiVo.setNum(api.getNum());
            apiVo.setName(api.getName());
            apiVo.setLevel(api.getLevel());
            apiVo.setModuleId(api.getModuleId());
            apiVo.setModuleName(api.getModuleName());
            apiVo.setProjectId(apiVo.getProjectId());
            apiVo.setPath(api.getPath());
            apiVo.setStatus(api.getStatus());
            apiVo.setUsername(api.getUsername());
            apiVo.setUpdateTime(api.getUpdateTime());
            apiVos.add(apiVo);
        }
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, apiVos));
    }
}
