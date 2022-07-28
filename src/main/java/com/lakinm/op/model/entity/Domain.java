package com.lakinm.op.model.entity;

public class Domain {
    private String id;

    private String domainKeyType;

    private String domainKey;

    private String domainData;

    private String environmentId;

    private String updateUser;

    private String createUser;

    private Long createTime;

    private Long updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDomainKeyType() {
        return domainKeyType;
    }

    public void setDomainKeyType(String domainKeyType) {
        this.domainKeyType = domainKeyType == null ? null : domainKeyType.trim();
    }

    public String getDomainKey() {
        return domainKey;
    }

    public void setDomainKey(String domainKey) {
        this.domainKey = domainKey == null ? null : domainKey.trim();
    }

    public String getDomainData() {
        return domainData;
    }

    public void setDomainData(String domainData) {
        this.domainData = domainData == null ? null : domainData.trim();
    }

    public String getEnvironmentId() {
        return environmentId;
    }

    public void setEnvironmentId(String environmentId) {
        this.environmentId = environmentId == null ? null : environmentId.trim();
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }
}