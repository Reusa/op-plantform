package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.CaseApi;
import com.lakinm.op.model.entity.CaseApiWithBLOBs;

public interface CaseApiMapper {
    int deleteByPrimaryKey(String id);

    int insert(CaseApiWithBLOBs record);

    int insertSelective(CaseApiWithBLOBs record);

    CaseApiWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(CaseApiWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(CaseApiWithBLOBs record);

    int updateByPrimaryKey(CaseApi record);
}