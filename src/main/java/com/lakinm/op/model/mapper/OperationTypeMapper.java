package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.OperationTypeDTO;
import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationType;

import java.util.List;

public interface OperationTypeMapper {

    List<OperationTypeDTO> findAllOperationType();
}