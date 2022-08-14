package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class ParamDataVo implements Serializable {
    private String id;

    private String name;

    private String groupId;

    private String dataType;

    private String description;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private String paramData;

}
