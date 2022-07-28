package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Engine;

public interface EngineMapper {
    int deleteByPrimaryKey(String id);

    int insert(Engine record);

    int insertSelective(Engine record);

    Engine selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Engine record);

    int updateByPrimaryKey(Engine record);
}