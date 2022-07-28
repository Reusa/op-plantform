package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Assertion;

public interface AssertionMapper {
    int deleteByPrimaryKey(String id);

    int insert(Assertion record);

    int insertSelective(Assertion record);

    Assertion selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Assertion record);

    int updateByPrimaryKey(Assertion record);
}