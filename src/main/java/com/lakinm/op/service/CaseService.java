package com.lakinm.op.service;

import com.lakinm.op.model.vo.CaseVo;
import com.lakinm.op.request.CaseRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;

import java.util.List;

public interface CaseService {
    Result addCase(String token, CaseRequest request);

    Result deleteCase(String id);

    Result getCaseDetail(String caseId, String caseType);

    List<CaseVo> getCaseList(QueryRequest request);
}
