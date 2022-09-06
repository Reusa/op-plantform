package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ReportCollectionCaseTransDTO;
import com.lakinm.op.model.entity.ReportCollectionCaseApi;

import java.util.List;

public interface ReportCollectionCaseApiMapper {
    List<ReportCollectionCaseTransDTO> selectByReportCaseId(String caseId);

    List<ReportCollectionCaseTransDTO> selectByRccId(String rccId);
}