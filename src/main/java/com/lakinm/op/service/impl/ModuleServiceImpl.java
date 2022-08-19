package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ModuleType;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.ModuleDTO;
import com.lakinm.op.model.entity.*;
import com.lakinm.op.model.mapper.ApiModuleMapper;
import com.lakinm.op.model.mapper.CaseModuleMapper;
import com.lakinm.op.model.mapper.PageModuleMapper;
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
    private PageModuleMapper pageModuleMapper;

    @Autowired
    private CaseModuleMapper caseModuleMapper;

    @Autowired
    private UserService userService;

    @Override
    public Result addModule(String token, ModuleRequest request) {
        ApiModule oldModule = apiModuleMapper.selectModByNameAndFa(request.getName(), request.getParentId(), request.getProjectId());
        if (oldModule != null) {
            return Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage(), null);
        }
        ApiModule saveMod = (ApiModule) addModules(token, request, ModuleType.API_MODULE.getType());
        if (saveMod == null) {
            return Result.fail(ResultEnum.FAILED.getCode(), ResultEnum.FAILED.getMessage());
        }
        if (request.getId() == null || request.getId().equals("")) {
            apiModuleMapper.insertModule(saveMod);
        } else {
            apiModuleMapper.updateModuleById(saveMod);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), saveMod);
    }

    @Override
    public Result deleteModule(ModuleRequest request) {
        List<Module> targetList = deleteModuleByTypes(request, ModuleType.API_MODULE.getType());
        if (targetList == null) {
            return Result.fail(ResultEnum.MODULE_NOT_EXIST.getCode(), ResultEnum.MODULE_NOT_EXIST.getMessage());
        }
        apiModuleMapper.deleteModuleByIds(targetList);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), targetList);
    }

    @Override
    public Result getApiModuleList(String projectId) {
        List<ModuleDTO> modList = getModuleListByTypes(projectId, ModuleType.API_MODULE.getType());
        if (modList == null) {
            return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.NO_MODULE_IN_PROJECT.getMessage(), null);
        }
//        modList.stream().sorted(Comparator.comparing(ModuleDTO::getCreateTime)).collect(Collectors.toList());

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), modList);
    }

    @Override
    public Result addPageModule(String token, ModuleRequest request) {
        PageModule oldModule = pageModuleMapper.selectModByNameAndFa(request.getName(), request.getParentId(), request.getProjectId());
        if (oldModule != null) {
            return Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage(), null);
        }
        PageModule saveMod = (PageModule) addModules(token, request, ModuleType.PAGE_MODULE.getType());
        if (saveMod == null) {
            return Result.fail(ResultEnum.FAILED.getCode(), ResultEnum.FAILED.getMessage());
        }
        if (request.getId() == null || request.getId().equals("")) {
            pageModuleMapper.insertModule(saveMod);
        } else {
            pageModuleMapper.updateModuleById(saveMod);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), saveMod);
    }

    @Override
    public Result deletePageModule(ModuleRequest request) {
        List<Module> targetList = deleteModuleByTypes(request, ModuleType.PAGE_MODULE.getType());
        if (targetList == null) {
            return Result.fail(ResultEnum.MODULE_NOT_EXIST.getCode(), ResultEnum.MODULE_NOT_EXIST.getMessage());
        }
        pageModuleMapper.deleteModuleByIds(targetList);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), targetList);
    }

    @Override
    public Result getPageModuleList(String projectId) {
        List<ModuleDTO> modList = getModuleListByTypes(projectId, ModuleType.PAGE_MODULE.getType());
        if (modList == null) {
            return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.NO_MODULE_IN_PROJECT.getMessage(), null);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), modList);
    }

    @Override
    public Result addCaseModule(String token, ModuleRequest request) {
        CaseModule oldModule = caseModuleMapper.selectModByNameAndFa(request.getName(), request.getParentId(), request.getProjectId());
        if (oldModule != null) {
            return Result.fail(ResultEnum.SAME_NAME.getCode(), ResultEnum.SAME_NAME.getMessage(), null);
        }
        CaseModule saveMod = (CaseModule) addModules(token, request, ModuleType.CASE_MODULE.getType());
        if (saveMod == null) {
            return Result.fail(ResultEnum.FAILED.getCode(), ResultEnum.FAILED.getMessage());
        }
        if (request.getId() == null || request.getId().equals("")) {
            caseModuleMapper.insertModule(saveMod);
        } else {
            caseModuleMapper.updateModuleById(saveMod);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), saveMod);
    }

    @Override
    public Result deleteCaseModule(ModuleRequest request) {
        List<Module> targetList = deleteModuleByTypes(request, ModuleType.CASE_MODULE.getType());
        if (targetList == null) {
            return Result.fail(ResultEnum.MODULE_NOT_EXIST.getCode(), ResultEnum.MODULE_NOT_EXIST.getMessage());
        }
        caseModuleMapper.deleteModuleByIds(targetList);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), targetList);
    }

    @Override
    public Result getCaseModuleList(String projectId) {
        List<ModuleDTO> modList = getModuleListByTypes(projectId, ModuleType.CASE_MODULE.getType());
        if (modList == null) {
            return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.NO_MODULE_IN_PROJECT.getMessage(), null);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), modList);
    }

    /*
    apiModules 全部子节点
    id 父节点id
 */
    private List<ModuleDTO> setChildModule(List<ModuleDTO> childMods, String id) {
        List<ModuleDTO> childList = new ArrayList<>();
        for (ModuleDTO mod : childMods) {
            if (mod.getParentId().equals(id)) {
                mod.setChildren(setChildModule(childMods, mod.getId()));
                childList.add(mod);
            }
        }
        return childList;
    }

    /*
    apiModules 全部子节点
    mid 需要删除的父节点id
    targetList 数组接收需要删除的节点
     */
    private void searchChildModules(List<Module> apiModules, String mid, List<Module> targetList) {
        for (Module mod : apiModules) {
            if (mod.getParentId().equals(mid)) {
                targetList.add(mod);
                searchChildModules(apiModules, mod.getId(), targetList);
            }
        }
    }

    /**
     * 根据不同类型模块生成模块对象
     * @param token
     * @param request
     * @param type 模块类型
     * @return
     */
    private Module addModules(String token, ModuleRequest request, String type) {
        String userId = userService.checkToken(token).getId();

        Module saveMod = null;
        if (type.equals(ModuleType.API_MODULE.getType())) {
            saveMod = new ApiModule();
        } else if (type.equals(ModuleType.PAGE_MODULE.getType())) {
            saveMod = new PageModule();
        } else if (type.equals(ModuleType.CASE_MODULE.getType())) {
            saveMod = new CaseModule();
        } else {
            return null;
        }
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
        } else {
            saveMod.setId(request.getId());
            saveMod.setUpdateUser(userId);
            saveMod.setUpdateTime(System.currentTimeMillis());
        }

        return saveMod;
    }

    private List<Module> deleteModuleByTypes(ModuleRequest request, String type) {
        String mid = request.getId();
        String parentId = request.getParentId();
        String projectId = request.getProjectId();
        if (parentId.equals("") || parentId == null){
            parentId = null;
        }
        List<Module> revMod = new ArrayList<>();
        List<Module> allMod = new ArrayList<>();
        if (type.equals(ModuleType.API_MODULE.getType())) {
            revMod = apiModuleMapper.selectModByIdAndParId(mid, parentId, projectId);
            allMod = apiModuleMapper.selectModByProId(projectId);
        } else if (type.equals(ModuleType.PAGE_MODULE.getType())) {
            revMod = pageModuleMapper.selectModByIdAndParId(mid, parentId, projectId);
            allMod = pageModuleMapper.selectModByProId(projectId);
        } else if (type.equals(ModuleType.CASE_MODULE.getType())) {
            revMod = caseModuleMapper.selectModByIdAndParId(mid, parentId, projectId);
            allMod = caseModuleMapper.selectModByProId(projectId);
        } else {
            return null;
        }
        List<Module> targetList = new ArrayList<>();
        for (Module temp : revMod) {
            targetList.add(temp);
        }
        searchChildModules(allMod, mid, targetList);

        if (targetList.size() > 0) {
            return targetList;
        }

        return null;
    }

    private List<ModuleDTO> getModuleListByTypes(String projectId, String type) {
        List<ModuleDTO> modList = new ArrayList<>();
        List<ModuleDTO> allApiMod = new ArrayList<>();
        List<ModuleDTO> childMods = new ArrayList<>();
        if (type.equals(ModuleType.API_MODULE.getType())) {
            allApiMod = apiModuleMapper.selectModuleDTOByProId(projectId);
            childMods = apiModuleMapper.selectChildModuleDTOByProId(projectId);
        } else if (type.equals(ModuleType.PAGE_MODULE.getType())) {
            allApiMod = pageModuleMapper.selectModuleDTOByProId(projectId);
            childMods = pageModuleMapper.selectChildModuleDTOByProId(projectId);
        } else if (type.equals(ModuleType.CASE_MODULE.getType())) {
            allApiMod = caseModuleMapper.selectModuleDTOByProId(projectId);
            childMods = caseModuleMapper.selectChildModuleDTOByProId(projectId);
        } else {
            return null;
        }
        for (ModuleDTO temp : allApiMod) {
            if (temp.getParentId() == null) {
                temp.setChildren(setChildModule(childMods, temp.getId()));
                modList.add(temp);
            }
        }

        return modList;
    }

}
