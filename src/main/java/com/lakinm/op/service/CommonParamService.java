package com.lakinm.op.service;

import com.lakinm.op.model.entity.ParamGroup;
import com.lakinm.op.model.vo.ParamDataVo;
import com.lakinm.op.request.ParamDataRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommonParamService {

    List<ParamGroup> getParamGroupList(QueryRequest queryRequest);

    void addParamGroup(ParamGroup paramGroup, String token);

    void deleteParamGroup(String id);

    Result addParamData(String token, ParamDataRequest request);

    List<ParamDataVo> getParamData(QueryRequest queryRequest);

    void deleteParamData(String paramDataId);
}
