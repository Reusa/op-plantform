package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Version;

public interface VersionMapper {
    int deleteByPrimaryKey(String id);

    int insert(Version record);

    int insertSelective(Version record);

    Version selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Version record);

    int updateByPrimaryKey(Version record);
}