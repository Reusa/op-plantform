package com.lakinm.op.service;

import com.lakinm.op.model.vo.CollectionVo;
import com.lakinm.op.request.CollectionRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface CollectionService {
    Result addCollection(String token, CollectionRequest request);

    Result deleteCol(String colId);

    Result getColDetail(String colId);

    List<CollectionVo> getColList(QueryRequest request);
}
