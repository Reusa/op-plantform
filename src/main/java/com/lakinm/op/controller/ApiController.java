package com.lakinm.op.controller;

import com.lakinm.op.request.ApiRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class ApiController {

    @Autowired
    private ApiService apiService;

    @PostMapping("/add")
    public Result addApi(@RequestHeader(value = "token") String token, @RequestBody ApiRequest request) {
        return apiService.addApi(token, request);
    }

    @GetMapping("/delete")
    public Result deleteApi(@RequestParam String id) {
        return apiService.deleteApi(id);
    }

    @GetMapping("/apiDetail")
    public Result getApiDetail(@RequestParam String id) {
        return apiService.getApiDetail(id);
    }

    @PostMapping("/getApiList")
    public Result getApiList(@RequestBody QueryRequest request) {
        return apiService.getApiList(request);
    }
}
