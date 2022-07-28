package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ReportCollection;

public interface ReportCollectionMapper {
    int deleteByPrimaryKey(String id);

    int insert(ReportCollection record);

    int insertSelective(ReportCollection record);

    ReportCollection selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReportCollection record);

    int updateByPrimaryKey(ReportCollection record);
}