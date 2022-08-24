package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.vo.CaseVo;
import com.lakinm.op.request.CaseRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/case")
public class CaseController {

    @Autowired
    private CaseService caseService;

    @PostMapping("/add")
    public Result addCase(@RequestHeader(value = "token") String token, @RequestBody CaseRequest request) {
        return caseService.addCase(token, request);
    }

    @GetMapping("/delete")
    public Result deleteCase(@RequestParam String id) {
        return caseService.deleteCase(id);
    }

    @GetMapping("/caseDetail")
    public Result getCaseDetail(@RequestParam String caseId, @RequestParam String caseType) {
        return caseService.getCaseDetail(caseId, caseType);
    }

    @PostMapping("/getCaseList")
    public Result getCaseList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<CaseVo> caseVoList = caseService.getCaseList(request);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, caseVoList));
    }


    @GetMapping("/getApiReport")
    public Result getApiCaseReport(@RequestParam String ApiId) {
        return null;
    }
}
