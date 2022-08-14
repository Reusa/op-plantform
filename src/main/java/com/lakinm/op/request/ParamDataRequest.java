package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class ParamDataRequest implements Serializable {

    private String id;

    private String name;

    private String groupId;

    private String dataType;

    private String description;

    private String paramData;

}
