package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class QueryRequest implements Serializable {

    private String condition;   // 模糊查找输入值
    private String moduleId;
    private String createUser;
    private String projectId;

    private String caseType; // 查找用例时用例类型
    private String collectionId; //查找报告时报告所属集合Id
    private String planId; //查找报告时报告所属计划Id
    private String operationType; // 查找控件时控件类型
    private String roleId; // 查找角色用户列表时所属角色Id
    private String requestUser; // 请求人
    private String paramGroupId; // 参数组Id

    // 分页
    private int page;
    private int pageSize;

}
