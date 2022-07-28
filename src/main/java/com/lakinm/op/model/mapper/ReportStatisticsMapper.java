package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ReportStatistics;

public interface ReportStatisticsMapper {
    int deleteByPrimaryKey(String id);

    int insert(ReportStatistics record);

    int insertSelective(ReportStatistics record);

    ReportStatistics selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReportStatistics record);

    int updateByPrimaryKey(ReportStatistics record);
}