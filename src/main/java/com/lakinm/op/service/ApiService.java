package com.lakinm.op.service;

import com.lakinm.op.request.ApiRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

public interface ApiService {
    Result addApi(String token, ApiRequest request);

    Result deleteApi(String id);

    Result getApiDetail(String id);

    Result getApiList(QueryRequest request);
}
