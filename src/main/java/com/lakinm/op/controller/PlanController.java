package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.vo.PlanVo;
import com.lakinm.op.request.PlanRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/plan")
public class PlanController {

    @Autowired
    private PlanService planService;

    @PostMapping("/add")
    public Result addPlan(@RequestHeader(value = "token") String token, @RequestBody PlanRequest request) {
        return planService.addPlan(token, request);
    }

    @GetMapping("/delete")
    public Result deletePlan(@RequestParam String planId) {
        return planService.deletePlan(planId);
    }

    @GetMapping("/detail")
    public Result planDetail(@RequestParam String planId) {
        return planService.getPlanDetail(planId);
    }

    @PostMapping("/getPlanList")
    public Result getPlanList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize);
        List<PlanVo> planVos = planService.getPlanList(request);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, planVos));
    }
}
