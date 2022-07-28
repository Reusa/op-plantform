package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ReportCollectionCaseWeb;
import com.lakinm.op.model.entity.ReportCollectionCaseWebWithBLOBs;

public interface ReportCollectionCaseWebMapper {
    int deleteByPrimaryKey(String id);

    int insert(ReportCollectionCaseWebWithBLOBs record);

    int insertSelective(ReportCollectionCaseWebWithBLOBs record);

    ReportCollectionCaseWebWithBLOBs selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ReportCollectionCaseWebWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ReportCollectionCaseWebWithBLOBs record);

    int updateByPrimaryKey(ReportCollectionCaseWeb record);
}