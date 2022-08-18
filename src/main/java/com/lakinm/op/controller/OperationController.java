package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationType;
import com.lakinm.op.model.vo.OperationTypeVo;
import com.lakinm.op.model.vo.OperationVo;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/operation")
public class OperationController {

    @Autowired
    private OperationService operationService;

    @GetMapping("/getOperationTypeList")
    public Result getOperationTypeList() {
        List<OperationTypeVo> operationTypes = operationService.getOperationTypeList();
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), operationTypes);
    }

    @PostMapping("/addOperation")
    public Result addOperation(@RequestHeader(value = "token") String token, @RequestBody OperationVo operationVo) {
        operationService.addOperation(token, operationVo);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("deleteOperation")
    public Result deleteOperation(@RequestParam String id) {
        operationService.deleteOperation(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/getOperationDetail")
    public Result getOperationDetail(@RequestParam String id) {
        OperationVo operationVo = operationService.getOperationDetail(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), operationVo);
    }

    @PostMapping("/getOperationList")
    public Result getOperationList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String condition = request.getCondition();
        String projectId = request.getProjectId();
        String type = request.getOperationType();

        List<OperationVo> operationVos = operationService.getOperationList(condition, projectId, type);
        Page<Object> po = PageHelper.startPage(page, pageSize, true);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, operationVos));
    }
}
