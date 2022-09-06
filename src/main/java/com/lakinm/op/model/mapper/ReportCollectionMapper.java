package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ReportCollectionDTO;
import com.lakinm.op.model.entity.ReportCollection;

import java.util.List;

public interface ReportCollectionMapper {
    List<ReportCollectionDTO> selectCsByReportId(String reportId);
}