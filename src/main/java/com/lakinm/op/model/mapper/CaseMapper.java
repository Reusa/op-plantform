package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Case;

public interface CaseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Case record);

    int insertSelective(Case record);

    Case selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Case record);

    int updateByPrimaryKeyWithBLOBs(Case record);

    int updateByPrimaryKey(Case record);
}