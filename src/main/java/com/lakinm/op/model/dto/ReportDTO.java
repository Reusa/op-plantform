package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.Report;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class ReportDTO extends Report implements Serializable {
    private String username;    // 执行人名字

    private Long total;

    private Long passCount;

    private Long failCount;

    private Long errorCount;

    private String passRate;

    private Integer progress;

    private List<ReportCollectionDTO> collectionList;
}
