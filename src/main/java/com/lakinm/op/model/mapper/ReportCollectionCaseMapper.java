package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ReportCollectionCaseDTO;
import com.lakinm.op.model.entity.ReportCollectionCase;

import java.util.List;

public interface ReportCollectionCaseMapper {
    ReportCollectionCaseDTO selectColCasesBytaskId(String projectId, String taskId);

    Integer countRccResult(String status, String rccId);

    List<ReportCollectionCaseDTO> selectRccByRcId(String rcId);
}