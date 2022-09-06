package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.ReportCollection;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ReportCollectionDTO extends ReportCollection implements Serializable {
    private Integer passCount;

    private Integer failCount;

    private Integer errorCount;

    private List<ReportCollectionCaseDTO> caseList;
}
