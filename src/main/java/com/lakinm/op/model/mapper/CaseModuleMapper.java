package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ModuleDTO;
import com.lakinm.op.model.entity.CaseModule;
import com.lakinm.op.model.entity.Module;

import java.util.List;

public interface CaseModuleMapper {
    CaseModule selectModByNameAndFa(String name, String parentId, String projectId);

    void insertModule(CaseModule saveMod);

    void updateModuleById(CaseModule saveMod);

    List<Module> selectModByIdAndParId(String mid, String parentId, String projectId);

    List<Module> selectModByProId(String projectId);

    void deleteModuleByIds(List<Module> targetList);

    List<ModuleDTO> selectModuleDTOByProId(String projectId);

    List<ModuleDTO> selectChildModuleDTOByProId(String projectId);
}