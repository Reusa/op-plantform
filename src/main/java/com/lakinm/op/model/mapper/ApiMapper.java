package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Api;
import com.lakinm.op.model.entity.ApiWithBLOBs;

public interface ApiMapper {
    int deleteByPrimaryKey(String id);

    int insert(ApiWithBLOBs record);

    int insertSelective(ApiWithBLOBs record);

    ApiWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ApiWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ApiWithBLOBs record);

    int updateByPrimaryKey(Api record);
}