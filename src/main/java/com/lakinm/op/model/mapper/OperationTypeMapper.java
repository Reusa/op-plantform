package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.OperationType;

public interface OperationTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OperationType record);

    int insertSelective(OperationType record);

    OperationType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OperationType record);

    int updateByPrimaryKey(OperationType record);
}