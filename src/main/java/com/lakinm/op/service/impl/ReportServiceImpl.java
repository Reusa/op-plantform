package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ReportStatus;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.ReportCollectionCaseDTO;
import com.lakinm.op.model.dto.ReportCollectionCaseTransDTO;
import com.lakinm.op.model.dto.ReportCollectionDTO;
import com.lakinm.op.model.dto.ReportDTO;
import com.lakinm.op.model.mapper.*;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReportServiceImpl implements ReportService {

    @Autowired
    private ReportMapper reportMapper;

    @Autowired
    private ReportCollectionCaseMapper reportCollectionCaseMapper;

    @Autowired
    private ReportCollectionMapper reportCollectionMapper;

    @Autowired
    private ReportCollectionCaseApiMapper reportCollectionCaseApiMapper;

    @Autowired
    private ReportCollectionCaseWebMapper reportCollectionCaseWebMapper;

    @Override
    public Result getColCaseReport(String projectId, String taskId) {
        ReportCollectionCaseDTO rcc =reportCollectionCaseMapper.selectColCasesBytaskId(projectId, taskId);
        List<ReportCollectionCaseTransDTO> transList = null;
        if (rcc != null) {
            if (rcc.getCaseType().equalsIgnoreCase("WEB")) {
                transList = reportCollectionCaseWebMapper.selectByReportCaseId(rcc.getCaseId());
            } else if (rcc.getCaseType().equalsIgnoreCase("API")) {
                transList = reportCollectionCaseApiMapper.selectByReportCaseId(rcc.getCaseId());
            } else {
                return Result.fail(ResultEnum.ERROR_PARAMS.getCode(), ResultEnum.ERROR_PARAMS.getMessage());
            }
        } else {
            return Result.success(200, "未查询到对应报告", null);
        }
        rcc.setReportCollectionCaseTrans(transList);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), rcc);
    }

    @Override
    public Result getPlanResult(String projectId, String reportId) {
        // 查报告详情
        ReportDTO report = reportMapper.selectReportById(projectId, reportId);
        // 根据报告查关联的集合
        List<ReportCollectionDTO> reportCollections = reportCollectionMapper.selectCsByReportId(reportId);
        // List<String> rcId = reportCollections.stream().map(p->p.getId()).collect(Collectors.toList());
        for (ReportCollectionDTO rc : reportCollections) {
            // 查集合关联的用例列表
            List<ReportCollectionCaseDTO> rccs = reportCollectionCaseMapper.selectRccByRcId(rc.getId());
            List<ReportCollectionCaseTransDTO> reportCollectionCaseTrans = new ArrayList<>();
            for (ReportCollectionCaseDTO rcc : rccs) {
                // 根据用例的id和类型查执行结果
                if (rcc.getCaseType().equalsIgnoreCase("WEB")) {
                    reportCollectionCaseTrans = reportCollectionCaseWebMapper.selectByRccId(rcc.getId());
                } else if (rcc.getCaseType().equalsIgnoreCase("API")) {
                    reportCollectionCaseTrans = reportCollectionCaseApiMapper.selectByRccId(rcc.getId());
                }
                rcc.setReportCollectionCaseTrans(reportCollectionCaseTrans);
            }
            rc.setCaseList(rccs);
            // 查集合的统计数据
            Integer passCount = reportCollectionCaseMapper.countRccResult(ReportStatus.SUCCESS.getStatus(), rc.getId());
            Integer failCount = reportCollectionCaseMapper.countRccResult(ReportStatus.FAIL.getStatus(), rc.getId());
            Integer errorCount = reportCollectionCaseMapper.countRccResult(ReportStatus.ERROR.getStatus(), rc.getId());
            rc.setPassCount(passCount);
            rc.setFailCount(failCount);
            rc.setErrorCount(errorCount);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), report);
    }

    @Override
    public void deleteReport(String reportId) {
        reportMapper.deleteReportById(reportId);
    }

    @Override
    public List<ReportDTO> getReportList(QueryRequest request) {
        String projectId = request.getProjectId();
        String condition = request.getCondition();
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        return reportMapper.selectReports(projectId, condition);
    }
}
