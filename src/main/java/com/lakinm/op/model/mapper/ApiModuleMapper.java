package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ApiModule;

public interface ApiModuleMapper {
    int deleteByPrimaryKey(String id);

    int insert(ApiModule record);

    int insertSelective(ApiModule record);

    ApiModule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ApiModule record);

    int updateByPrimaryKey(ApiModule record);
}