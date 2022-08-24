package com.lakinm.op.request;

import com.alibaba.fastjson.JSONArray;
import lombok.Data;

import java.io.Serializable;

@Data
public class WebCaseRequest implements Serializable {
    private String id;

    private Integer index;

    private String caseId;

    private String operationId;

    private JSONArray element;

    private JSONArray data;
}
