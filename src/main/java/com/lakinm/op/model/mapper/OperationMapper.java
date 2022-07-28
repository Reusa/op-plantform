package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationWithBLOBs;

public interface OperationMapper {
    int deleteByPrimaryKey(String id);

    int insert(OperationWithBLOBs record);

    int insertSelective(OperationWithBLOBs record);

    OperationWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(OperationWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(OperationWithBLOBs record);

    int updateByPrimaryKey(Operation record);
}