package com.lakinm.op.controller;

import com.lakinm.op.request.ModuleRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/module")
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @PostMapping("/api/add")
    public Result addApiModule(@RequestHeader(value = "token") String token, @RequestBody ModuleRequest request) {
        return moduleService.addModule(token, request);
    }

    @PostMapping("/api/delete")
    public Result deleteApiModule(@RequestBody ModuleRequest request) {
        return moduleService.deleteModule(request);
    }

    @GetMapping("/api/getModuleList")
    public Result getApiModuleList(@RequestParam String projectId) {
        return moduleService.getApiModuleList(projectId);
    }

    @PostMapping("/page/add")
    public Result addPageModule(@RequestHeader(value = "token") String token, @RequestBody ModuleRequest request) {
        return moduleService.addPageModule(token, request);
    }

    @PostMapping("/page/delete")
    public Result deletePageModule(@RequestBody ModuleRequest request) {
        return moduleService.deletePageModule(request);
    }

    @GetMapping("/page/getModuleList")
    public Result getPageModuleList(@RequestParam String projectId) {
        return moduleService.getPageModuleList(projectId);
    }

    @PostMapping("/case/add")
    public Result addCaseModule(@RequestHeader(value = "token") String token, @RequestBody ModuleRequest request) {
        return moduleService.addCaseModule(token, request);
    }

    @PostMapping("/case/delete")
    public Result deleteCaseModule(@RequestBody ModuleRequest request) {
        return moduleService.deleteCaseModule(request);
    }

    @GetMapping("/case/getModuleList")
    public Result getCaseModuleList(@RequestParam String projectId) {
        return moduleService.getCaseModuleList(projectId);
    }

}
