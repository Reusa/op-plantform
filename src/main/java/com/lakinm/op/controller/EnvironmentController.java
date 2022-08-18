package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.dto.EnvironmentDTO;
import com.lakinm.op.model.entity.Environment;
import com.lakinm.op.model.vo.EnvironmentVo;
import com.lakinm.op.request.EnvironmentRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.EnvironmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/environment")
public class EnvironmentController {

    @Autowired
    private EnvironmentService environmentService;

    @PostMapping("/add")
    public Result addEnvironment(@RequestHeader(value = "token") String token, @RequestBody EnvironmentRequest request) {
        environmentService.addEnvironment(token, request);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/delete")
    public Result deleteEnvironment(@RequestParam String id) {
        environmentService.deleteEnvironment(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/getEnvironment")
    public Result getAllEnvironment(@RequestParam String projectId) {
        List<Environment> environmentList = environmentService.getAllEnvironment(projectId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), environmentList);
    }

    @PostMapping("/getEnvironmentList")
    public Result getEnvironmentList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String projectId = request.getProjectId();
        String condition = request.getCondition();
        List<EnvironmentVo> environments = environmentService.getEnvironmentList(projectId, condition);
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, environments));
    }
}
