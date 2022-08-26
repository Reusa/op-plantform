package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.PlanCollectionDTO;
import com.lakinm.op.model.entity.PlanCollection;

import java.util.List;

public interface PlanCollectionMapper {
    void deleteCollectionByPlanId(String id);

    void insertPlanCollection(List<PlanCollection> planCollections);

    List<PlanCollectionDTO> selectCollectionByPlanId(String planId);
}