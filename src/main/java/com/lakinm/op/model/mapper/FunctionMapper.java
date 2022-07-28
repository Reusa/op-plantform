package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Function;
import com.lakinm.op.model.entity.FunctionWithBLOBs;

public interface FunctionMapper {
    int deleteByPrimaryKey(String id);

    int insert(FunctionWithBLOBs record);

    int insertSelective(FunctionWithBLOBs record);

    FunctionWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FunctionWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(FunctionWithBLOBs record);

    int updateByPrimaryKey(Function record);
}