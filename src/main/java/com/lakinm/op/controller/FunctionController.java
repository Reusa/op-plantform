package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.vo.FunctionVo;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/function")
public class FunctionController {

    @Autowired
    private FunctionService functionService;

    @PostMapping("/addFunction")
    public Result addFunction(@RequestHeader(value = "token") String token, @RequestBody FunctionVo functionVo) {
        functionService.saveFunction(functionVo, token);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/deleteFunction")
    public Result deleteFunction(@RequestParam String functionId) {
        functionService.deleteFunction(functionId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("functionDetail")
    public Result getFunctionDetail(@RequestParam String functionId) {
        FunctionVo function = functionService.findFunctionDetail(functionId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), function);
    }

    @PostMapping("/functionList")
    public Result getFunctionList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String condition = request.getCondition();
        String projectId = request.getProjectId();

        List<FunctionVo> functionVos = functionService.getFunctionList(condition, projectId);
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, functionVos));
    }
}
