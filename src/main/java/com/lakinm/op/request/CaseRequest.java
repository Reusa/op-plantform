package com.lakinm.op.request;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class CaseRequest implements Serializable {
    private String id;

    private Long num;

    private String name;

    private String level;

    private String moduleId;

    private String moduleName;

    private String projectId;

    private String type;

    private String thirdParty;

    private String description;

    private JSONArray environmentIds;

    private JSONObject commonParam;

    private String status;

    private List<ApiCaseRequest> apiCases;

    private List<WebCaseRequest> webCases;
}
