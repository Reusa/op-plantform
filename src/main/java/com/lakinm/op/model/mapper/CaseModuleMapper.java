package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.CaseModule;

public interface CaseModuleMapper {
    int deleteByPrimaryKey(String id);

    int insert(CaseModule record);

    int insertSelective(CaseModule record);

    CaseModule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CaseModule record);

    int updateByPrimaryKey(CaseModule record);
}