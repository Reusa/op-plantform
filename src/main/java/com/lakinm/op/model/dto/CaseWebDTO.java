package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.CaseWeb;
import lombok.Data;

import java.io.Serializable;

@Data
public class CaseWebDTO extends CaseWeb implements Serializable {
    private String operationName;

    private String operationType;
}
