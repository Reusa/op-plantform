package com.lakinm.op.controller;

import com.lakinm.op.request.ModuleRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/apiModule")
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @PostMapping("/add")
    public Result addModule(@RequestHeader(value = "token") String token, @RequestBody ModuleRequest request) {
        return moduleService.addModule(token, request);
    }

    @PostMapping("/delete")
    public Result deleteModule(@RequestBody ModuleRequest request) {
        return moduleService.deleteModule(request);
    }

    @PostMapping("/getModuleList")
    public Result getModuleList() {
        return null;
    }
}
