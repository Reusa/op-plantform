package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.PlanSchedule;

public interface PlanScheduleMapper {
    int deleteByPrimaryKey(String id);

    int insert(PlanSchedule record);

    int insertSelective(PlanSchedule record);

    PlanSchedule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PlanSchedule record);

    int updateByPrimaryKey(PlanSchedule record);
}