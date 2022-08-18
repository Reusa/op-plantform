package com.lakinm.op.service;

import com.lakinm.op.request.ModuleRequest;
import com.lakinm.op.response.Result;

public interface ModuleService {
    Result addModule(String token, ModuleRequest request);

    Result deleteModule(ModuleRequest request);
}
