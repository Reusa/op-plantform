package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.CollectionCase;

public interface CollectionCaseMapper {
    int deleteByPrimaryKey(String id);

    int insert(CollectionCase record);

    int insertSelective(CollectionCase record);

    CollectionCase selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CollectionCase record);

    int updateByPrimaryKey(CollectionCase record);
}