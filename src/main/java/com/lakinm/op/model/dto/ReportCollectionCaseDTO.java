package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.ReportCollectionCase;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ReportCollectionCaseDTO extends ReportCollectionCase implements Serializable {
    private List<ReportCollectionCaseTransDTO> reportCollectionCaseTrans;
}
