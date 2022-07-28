package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.UserProject;

public interface UserProjectMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserProject record);

    int insertSelective(UserProject record);

    UserProject selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserProject record);

    int updateByPrimaryKey(UserProject record);
}