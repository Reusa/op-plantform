package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ParamGroup;

public interface ParamGroupMapper {
    int deleteByPrimaryKey(String id);

    int insert(ParamGroup record);

    int insertSelective(ParamGroup record);

    ParamGroup selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ParamGroup record);

    int updateByPrimaryKey(ParamGroup record);
}