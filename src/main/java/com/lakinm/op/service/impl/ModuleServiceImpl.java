package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.entity.Api;
import com.lakinm.op.model.entity.ApiModule;
import com.lakinm.op.model.mapper.ApiModuleMapper;
import com.lakinm.op.request.ModuleRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ModuleService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ApiModuleMapper apiModuleMapper;

    @Autowired
    private UserService userService;

    @Override
    public Result addModule(String token, ModuleRequest request) {
        String userId = userService.checkToken(token).getId();
        ApiModule oldModule = apiModuleMapper.selectModByNameAndFa(request.getName(), request.getParentId(), request.getProjectId());
        if (oldModule != null) {
            return Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage(), null);
        }
        ApiModule saveMod = new ApiModule();
        saveMod.setName(request.getName());
        saveMod.setProjectId(request.getProjectId());
        if (request.getParentId() == null || request.getParentId().equals("")) {
            saveMod.setParentId(null);
        } else {
            saveMod.setParentId(request.getParentId());
        }
        if (request.getId() == null || request.getId().equals("")) {
            saveMod.setId(UUID.randomUUID().toString());
            saveMod.setCreateTime(System.currentTimeMillis());
            saveMod.setCreateUser(userId);
            saveMod.setUpdateTime(System.currentTimeMillis());
            saveMod.setUpdateUser(userId);
            apiModuleMapper.insertModule(saveMod);
        } else {
            saveMod.setUpdateUser(userId);
            saveMod.setUpdateTime(System.currentTimeMillis());
            apiModuleMapper.updateModuleById(saveMod);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), saveMod);
    }

    @Override
    public Result deleteModule(ModuleRequest request) {
        String mid = request.getId();
        String parentId = request.getParentId();
        String projectId = request.getProjectId();
        if (parentId.equals("") || parentId == null){
            parentId = null;
        }
        List<ApiModule> revMod = apiModuleMapper.selectModByIdAndParId(mid, parentId, projectId);
        List<ApiModule> allApiMod = apiModuleMapper.selectModByProId(projectId);
        List<ApiModule> removeMod = new ArrayList<>();
        for (ApiModule temp : revMod) {
            removeMod.add(temp);
        }
        List<ApiModule> needRevMods = searchChildModules(allApiMod, mid);
        for (ApiModule rev : needRevMods) {
            removeMod.add(rev);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), removeMod);
    }

    private List<ApiModule> searchChildModules(List<ApiModule> apiModules, String mid) {
        List<ApiModule> needRevMods = new ArrayList<>();
        for (ApiModule mod : apiModules) {
            if (mod.getParentId().equals(mid)) {
                needRevMods.add(mod);
                searchChildModules(apiModules, mod.getId());
            }
        }
        return needRevMods;
    }
}
