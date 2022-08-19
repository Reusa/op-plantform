package com.lakinm.op.request;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.Data;

import java.io.Serializable;

@Data
public class ApiRequest implements Serializable {
    private String id;

    private String name;

    private String level;

    private String moduleId;

    private String projectId;

    private String method;

    private String path;

    private String protocol;

    private String domainSign;

    private String description;

    private JSONArray header;

    private JSONObject body;

    private JSONArray query;

    private JSONArray rest;

    private String status;
}
