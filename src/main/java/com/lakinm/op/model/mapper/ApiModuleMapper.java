package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ModuleDTO;
import com.lakinm.op.model.entity.ApiModule;
import com.lakinm.op.model.entity.Module;

import java.util.List;

public interface ApiModuleMapper {
    ApiModule selectModByNameAndFa(String name, String parentId, String projectId);

    void insertModule(ApiModule saveMod);

    void updateModuleById(ApiModule saveMod);

    List<Module> selectModByIdAndParId(String mid, String parentId, String projectId);

    List<Module> selectModByProId(String projectId);

    void deleteModuleByIds(List<Module> targetList);

    List<ModuleDTO> selectModuleDTOByProId(String projectId);

    List<ModuleDTO> selectChildModuleDTOByProId(String projectId);
}