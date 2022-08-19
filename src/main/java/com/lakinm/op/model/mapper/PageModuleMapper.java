package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ModuleDTO;
import com.lakinm.op.model.entity.Module;
import com.lakinm.op.model.entity.PageModule;

import java.util.List;

public interface PageModuleMapper {
    PageModule selectModByNameAndFa(String name, String parentId, String projectId);

    void insertModule(PageModule saveMod);

    void updateModuleById(PageModule saveMod);

    List<Module> selectModByIdAndParId(String mid, String parentId, String projectId);

    List<Module> selectModByProId(String projectId);

    void deleteModuleByIds(List<Module> targetList);

    List<ModuleDTO> selectModuleDTOByProId(String projectId);

    List<ModuleDTO> selectChildModuleDTOByProId(String projectId);
}