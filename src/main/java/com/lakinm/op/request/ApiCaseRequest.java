package com.lakinm.op.request;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.Data;

import java.io.Serializable;

@Data
public class ApiCaseRequest implements Serializable {
    private String id;

    private Integer index;

    private String caseId;

    private String apiId;

    private JSONArray header;

    private JSONObject body;

    private JSONArray query;

    private JSONArray rest;

    private JSONArray assertion;

    private JSONArray relation;

    private JSONArray controller;
}
