package com.lakinm.op.model.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.lakinm.op.model.entity.CollectionCase;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CollectionVo implements Serializable {
    private String id;

    private String name;

    private String versionId;

    private String description;

    private String projectId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    private String username;

    private String versionName;

    private List<CollectionCaseVo> collectionCases;
}
