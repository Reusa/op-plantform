package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.FunctionDTO;
import com.lakinm.op.model.entity.Function;
import com.lakinm.op.model.entity.FunctionWithBLOBs;
import com.lakinm.op.model.vo.FunctionVo;

import java.util.List;

public interface FunctionMapper {

    Function selectFunctionByName(String name);

    void insertFunction(Function function);

    void updateFunction(Function function);

    void deleteFunctionById(String functionId);

    Function findFunctionDetailById(String functionId);

    List<FunctionDTO> getFunctionList(String condition, String projectId);
}