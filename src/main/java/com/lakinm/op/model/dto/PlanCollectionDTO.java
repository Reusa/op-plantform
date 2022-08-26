package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.PlanCollection;
import lombok.Data;

import java.io.Serializable;

@Data
public class PlanCollectionDTO extends PlanCollection implements Serializable {
    private String collectionName;

    private String collectionVersion;
}
