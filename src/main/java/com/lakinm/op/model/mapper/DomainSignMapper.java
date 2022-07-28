package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.DomainSign;

public interface DomainSignMapper {
    int deleteByPrimaryKey(String id);

    int insert(DomainSign record);

    int insertSelective(DomainSign record);

    DomainSign selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DomainSign record);

    int updateByPrimaryKey(DomainSign record);
}