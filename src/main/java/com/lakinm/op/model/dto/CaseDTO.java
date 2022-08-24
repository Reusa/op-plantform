package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.Case;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class CaseDTO extends Case implements Serializable {

    private String moduleName;

    private String username;

    private List<CaseApiDTO> caseApis;

    private List<CaseWebDTO> caseWebs;
}
