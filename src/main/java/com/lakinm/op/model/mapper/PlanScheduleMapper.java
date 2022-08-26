package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.PlanSchedule;

public interface PlanScheduleMapper {
    void insertSchedule(PlanSchedule planSchedule);

    PlanSchedule selectScheduleByPlanId(String id);

    void updateScheduleById(PlanSchedule planSchedule);
}