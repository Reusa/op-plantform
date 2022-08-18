package com.lakinm.op.service;

import com.lakinm.op.model.vo.EngineVo;
import com.lakinm.op.request.EngineRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface EngineService {
    Result addEngine(String token, EngineRequest request);

    Result deleteEngine(String id);

    Result getEngineDetail(String id);

    Result getEngines(String projectId);

    List<EngineVo> getEngineList(QueryRequest request);
}
