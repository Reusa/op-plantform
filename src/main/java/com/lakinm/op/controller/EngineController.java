package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.vo.EngineVo;
import com.lakinm.op.request.EngineRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.EngineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/engine")
public class EngineController {

    @Autowired
    private EngineService engineService;

    @PostMapping("/add")
    public Result addEngine(@RequestHeader(value = "token") String token, @RequestBody EngineRequest request) {
        return engineService.addEngine(token, request);
    }

    @GetMapping("/delete")
    public Result deleteEngine(@RequestParam String id) {
        return engineService.deleteEngine(id);
    }

    @GetMapping("/detail")
    public Result engineDetail(@RequestParam String id) {
        return engineService.getEngineDetail(id);
    }

    @GetMapping("/getEngines")
    public Result getAllEngines(@RequestParam String projectId) {
        return engineService.getEngines(projectId);
    }

    @PostMapping("/getEngineList")
    public Result getEngineList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        List<EngineVo> engineVos = engineService.getEngineList(request);
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, engineVos));
    }
}
