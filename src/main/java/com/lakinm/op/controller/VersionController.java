package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.entity.Version;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/version")
public class VersionController {

    @Autowired
    private VersionService versionService;

    @PostMapping("/add")
    public Result addVersion(@RequestHeader(value = "token") String token, @RequestBody Version version) {
        return versionService.addVersion(token, version);
    }

    @GetMapping("/delete")
    public Result deleteVersion(@RequestParam String versionId) {
        return versionService.deleteVersion(versionId);
    }

    @GetMapping("/versionList")
    public Result getProjectVersionList(@RequestParam String projectId) {
        List<Version> versions = versionService.getProjectVersionList(projectId, null);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), versions);
    }

    @PostMapping("/pageList")
    public Result getPageVersionList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String projectId = request.getProjectId();
        String condition = request.getCondition();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<Version> versions = versionService.getProjectVersionList(projectId, condition);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, versions));
    }
}
