package com.lakinm.op.service;

import com.lakinm.op.model.dto.ReportDTO;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface ReportService {
    Result getColCaseReport(String projectId, String taskId);

    Result getPlanResult(String projectId, String reportId);

    void deleteReport(String reportId);

    List<ReportDTO> getReportList(QueryRequest request);
}
