package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.DebugData;

public interface DebugDataMapper {
    int deleteByPrimaryKey(String id);

    int insert(DebugData record);

    int insertSelective(DebugData record);

    DebugData selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DebugData record);

    int updateByPrimaryKeyWithBLOBs(DebugData record);
}