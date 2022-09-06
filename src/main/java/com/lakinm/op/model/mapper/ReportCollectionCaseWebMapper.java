package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ReportCollectionCaseTransDTO;
import com.lakinm.op.model.entity.ReportCollectionCaseWeb;
import com.lakinm.op.model.entity.ReportCollectionCaseWebWithBLOBs;

import java.util.List;

public interface ReportCollectionCaseWebMapper {
    List<ReportCollectionCaseTransDTO> selectByReportCaseId(String caseId);

    List<ReportCollectionCaseTransDTO> selectByRccId(String rccId);
}