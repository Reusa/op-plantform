package com.lakinm.op.controller;

import com.lakinm.op.request.ElementRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/element")
public class ElementController {

    @Autowired
    private ElementService elementService;

    @PostMapping("/add")
    public Result addElement(@RequestHeader(value = "token")String token, @RequestBody ElementRequest request) {
        return elementService.addElement(token, request);
    }

    @GetMapping("/delete")
    public Result deleteElement(@RequestParam String id) {
        return elementService.deleteElement(id);
    }

    @GetMapping("/detail")
    public Result elementDetail(@RequestParam String id) {
        return elementService.getDetail(id);
    }

    @GetMapping("/allElement")
    public Result getAllElement(@RequestParam String projectId, @RequestParam String moduleId) {
        return elementService.getAllElement(projectId, moduleId);
    }

    @PostMapping("/getElementList")
    public Result getElementList(@RequestBody QueryRequest request) {
        return elementService.getElementList(request);
    }
}
