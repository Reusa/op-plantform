package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ParamData;

public interface ParamDataMapper {
    int deleteByPrimaryKey(String id);

    int insert(ParamData record);

    int insertSelective(ParamData record);

    ParamData selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ParamData record);

    int updateByPrimaryKeyWithBLOBs(ParamData record);

    int updateByPrimaryKey(ParamData record);
}