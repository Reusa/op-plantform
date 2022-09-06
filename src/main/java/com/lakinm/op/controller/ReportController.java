package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.dto.ReportDTO;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("/case")
    public Result getCaseReport(@RequestParam String projectId, @RequestParam String taskId) {
        return reportService.getColCaseReport(projectId, taskId);
    }

    @GetMapping("/plan")
    public Result getPlanResult(@RequestParam String projectId, @RequestParam String reportId) {
        return reportService.getPlanResult(projectId, reportId);
    }

    @GetMapping("/delete")
    public Result deleteReport(@RequestParam String reportId) {
        reportService.deleteReport(reportId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @PostMapping("/getReportList")
    public Result getReportList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<ReportDTO> reportDTOS = reportService.getReportList(request);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, reportDTOS));
    }
}
