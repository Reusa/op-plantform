package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.SumStatistics;
import com.lakinm.op.model.entity.SumStatisticsWithBLOBs;

public interface SumStatisticsMapper {
    int deleteByPrimaryKey(String projectId);

    int insert(SumStatisticsWithBLOBs record);

    int insertSelective(SumStatisticsWithBLOBs record);

    SumStatisticsWithBLOBs selectByPrimaryKey(String projectId);

    int updateByPrimaryKeySelective(SumStatisticsWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(SumStatisticsWithBLOBs record);

    int updateByPrimaryKey(SumStatistics record);
}