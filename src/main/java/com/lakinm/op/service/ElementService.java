package com.lakinm.op.service;

import com.lakinm.op.request.ElementRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

public interface ElementService {
    Result addElement(String token, ElementRequest request);

    Result deleteElement(String id);

    Result getAllElement(String projectId, String moduleId);

    Result getElementList(QueryRequest request);

    Result getDetail(String id);
}
