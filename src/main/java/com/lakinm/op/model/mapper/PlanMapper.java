package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Plan;

public interface PlanMapper {
    int deleteByPrimaryKey(String id);

    int insert(Plan record);

    int insertSelective(Plan record);

    Plan selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Plan record);

    int updateByPrimaryKey(Plan record);
}