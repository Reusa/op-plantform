package com.lakinm.op.service;

import com.lakinm.op.model.vo.FunctionVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FunctionService {
    void saveFunction(FunctionVo functionVo, String token);

    void deleteFunction(String functionId);

    FunctionVo findFunctionDetail(String functionId);

    List<FunctionVo> getFunctionList(String condition, String projectId);
}
