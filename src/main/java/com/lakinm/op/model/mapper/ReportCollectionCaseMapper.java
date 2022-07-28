package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ReportCollectionCase;

public interface ReportCollectionCaseMapper {
    int deleteByPrimaryKey(String id);

    int insert(ReportCollectionCase record);

    int insertSelective(ReportCollectionCase record);

    ReportCollectionCase selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReportCollectionCase record);

    int updateByPrimaryKey(ReportCollectionCase record);
}