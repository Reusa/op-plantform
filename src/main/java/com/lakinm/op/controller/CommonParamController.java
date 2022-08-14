package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.entity.ParamData;
import com.lakinm.op.model.entity.ParamGroup;
import com.lakinm.op.model.vo.ParamDataVo;
import com.lakinm.op.request.ParamDataRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CommonParamService;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/commonParam")
public class CommonParamController {

    @Autowired
    private CommonParamService commonParamService;

    @PostMapping("/getParamGroupList")
    public Result getGroupList(@RequestBody QueryRequest queryRequest){
        int page = queryRequest.getPage();
        int pageSize = queryRequest.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<ParamGroup> paramGroups = commonParamService.getParamGroupList(queryRequest);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, paramGroups));
    }

    @PostMapping("/addParamGroup")
    public Result addParamGroup(@RequestHeader(value = "token") String token, @RequestBody ParamGroup paramGroup) {
        commonParamService.addParamGroup(paramGroup, token);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/deleteParamGroup")
    public Result deleteParamGroup(@RequestParam String id) {
        commonParamService.deleteParamGroup(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @GetMapping("/getParamData")
    public Result getParamData(@RequestBody QueryRequest queryRequest) {
        int page = queryRequest.getPage();
        int pageSize = queryRequest.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<ParamDataVo> paramData = commonParamService.getParamData(queryRequest);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, paramData));
    }

    @PostMapping("/addParamData")
    public Result addParamData(@RequestHeader(value = "token") String token, @RequestBody ParamDataRequest request) {
        return commonParamService.addParamData(token, request);
    }

    @GetMapping("/deleteParamData")
    public Result deleteParamData(@RequestParam String paramDataId) {
        if (StringUtils.isNullOrEmpty(paramDataId)) {
            return Result.fail(ResultEnum.FAILED.getCode(), ResultEnum.FAILED.getMessage());
        }
        commonParamService.deleteParamData(paramDataId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }
}
