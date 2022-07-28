package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.PageModule;

public interface PageModuleMapper {
    int deleteByPrimaryKey(String id);

    int insert(PageModule record);

    int insertSelective(PageModule record);

    PageModule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PageModule record);

    int updateByPrimaryKey(PageModule record);
}