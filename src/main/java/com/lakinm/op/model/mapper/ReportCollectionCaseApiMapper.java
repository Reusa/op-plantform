package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ReportCollectionCaseApi;

public interface ReportCollectionCaseApiMapper {
    int deleteByPrimaryKey(String id);

    int insert(ReportCollectionCaseApi record);

    int insertSelective(ReportCollectionCaseApi record);

    ReportCollectionCaseApi selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReportCollectionCaseApi record);

    int updateByPrimaryKeyWithBLOBs(ReportCollectionCaseApi record);

    int updateByPrimaryKey(ReportCollectionCaseApi record);
}