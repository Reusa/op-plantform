package com.lakinm.op.service;

import com.lakinm.op.model.dto.OperationTypeDTO;
import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationType;
import com.lakinm.op.model.vo.OperationTypeVo;
import com.lakinm.op.model.vo.OperationVo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OperationService {
    List<OperationTypeVo> getOperationTypeList();

    void addOperation(String token, OperationVo operationVo);

    void deleteOperation(String id);

    OperationVo getOperationDetail(String id);

    List<OperationVo> getOperationList(String condition, String projectId, String type);
}
