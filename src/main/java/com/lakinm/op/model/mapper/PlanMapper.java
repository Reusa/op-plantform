package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.PlanDTO;
import com.lakinm.op.model.entity.Plan;

import java.util.List;

public interface PlanMapper {
    void insertPlan(Plan plan);

    void updatePlanById(Plan plan);

    void deletePlanById(String planId);

    PlanDTO selectPlanById(String planId);

    List<PlanDTO> selectPlanListByCondition(String projectId, String condition);
}