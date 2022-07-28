package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.DailyStatistics;
import com.lakinm.op.model.entity.DailyStatisticsKey;

public interface DailyStatisticsMapper {
    int deleteByPrimaryKey(DailyStatisticsKey key);

    int insert(DailyStatistics record);

    int insertSelective(DailyStatistics record);

    DailyStatistics selectByPrimaryKey(DailyStatisticsKey key);

    int updateByPrimaryKeySelective(DailyStatistics record);

    int updateByPrimaryKey(DailyStatistics record);
}