package com.lakinm.op.service;

import com.lakinm.op.model.vo.PlanVo;
import com.lakinm.op.request.PlanRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface PlanService {
    Result addPlan(String token, PlanRequest request);

    Result deletePlan(String planId);

    Result getPlanDetail(String planId);

    List<PlanVo> getPlanList(QueryRequest request);
}
