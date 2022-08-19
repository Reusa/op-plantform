package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ApiModuleDTO;
import com.lakinm.op.model.entity.ApiModule;

import java.util.List;

public interface ApiModuleMapper {
    ApiModule selectModByNameAndFa(String name, String parentId, String projectId);

    void insertModule(ApiModule saveMod);

    void updateModuleById(ApiModule saveMod);

    List<ApiModule> selectModByIdAndParId(String mid, String parentId, String projectId);

    List<ApiModule> selectModByProId(String projectId);

    void deleteModuleByIds(List<ApiModule> targetList);

    List<ApiModuleDTO> selectModuleDTOByProId(String projectId);

    List<ApiModuleDTO> selectChildModuleDTOByProId(String projectId);
}