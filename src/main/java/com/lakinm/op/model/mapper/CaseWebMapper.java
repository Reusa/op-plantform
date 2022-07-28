package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.CaseWeb;
import com.lakinm.op.model.entity.CaseWebWithBLOBs;

public interface CaseWebMapper {
    int deleteByPrimaryKey(String id);

    int insert(CaseWebWithBLOBs record);

    int insertSelective(CaseWebWithBLOBs record);

    CaseWebWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CaseWebWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(CaseWebWithBLOBs record);

    int updateByPrimaryKey(CaseWeb record);
}