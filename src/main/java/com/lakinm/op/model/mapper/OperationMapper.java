package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.OperationDTO;
import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationWithBLOBs;

import java.util.List;

public interface OperationMapper {
    Operation findOperationByName(String name, String projectId);

    void insertOperation(Operation operation);

    void updateOperation(Operation operation);

    void deleteOperationById(String id);

    Operation findOperationById(String id);

    List<OperationDTO> findAllOperation(String condition, String projectId, String type);
}