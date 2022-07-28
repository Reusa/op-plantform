package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Domain;

public interface DomainMapper {
    int deleteByPrimaryKey(String id);

    int insert(Domain record);

    int insertSelective(Domain record);

    Domain selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Domain record);

    int updateByPrimaryKey(Domain record);
}