package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ReportDTO;
import com.lakinm.op.model.entity.Report;

import java.util.List;

public interface ReportMapper {
    ReportDTO selectReportById(String projectId, String reportId);

    void deleteReportById(String reportId);

    List<ReportDTO> selectReports(String projectId, String condition);
}