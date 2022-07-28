package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Environment;

public interface EnvironmentMapper {
    int deleteByPrimaryKey(String id);

    int insert(Environment record);

    int insertSelective(Environment record);

    Environment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Environment record);

    int updateByPrimaryKey(Environment record);
}