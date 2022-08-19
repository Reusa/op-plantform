package com.lakinm.op.service;

import com.lakinm.op.request.ModuleRequest;
import com.lakinm.op.response.Result;

public interface ModuleService {
    Result addModule(String token, ModuleRequest request);

    Result deleteModule(ModuleRequest request);

    Result getApiModuleList(String projectId);

    Result addPageModule(String token, ModuleRequest request);

    Result deletePageModule(ModuleRequest request);

    Result getPageModuleList(String projectId);

    Result addCaseModule(String token, ModuleRequest request);

    Result deleteCaseModule(ModuleRequest request);

    Result getCaseModuleList(String projectId);
}
