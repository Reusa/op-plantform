package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.CaseApi;
import lombok.Data;

import java.io.Serializable;

@Data
public class CaseApiDTO extends CaseApi implements Serializable {
    private String apiName;

    private String apiPath;

    private String apiMethod;

    private String apiProtocol;

    private String apiDomainSign;
}
