package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.PlanCollection;

public interface PlanCollectionMapper {
    int deleteByPrimaryKey(String id);

    int insert(PlanCollection record);

    int insertSelective(PlanCollection record);

    PlanCollection selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PlanCollection record);

    int updateByPrimaryKey(PlanCollection record);
}