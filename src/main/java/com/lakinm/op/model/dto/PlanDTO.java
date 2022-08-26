package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.Plan;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PlanDTO extends Plan implements Serializable {
    private String startTime;

    private String frequency;

    private String username;

    private String versionName;

    private String environmentName;

    private List<PlanCollectionDTO> planCollections;
}
