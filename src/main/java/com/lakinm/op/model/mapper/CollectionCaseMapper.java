package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.CollectionCase;
import com.lakinm.op.model.vo.CollectionCaseVo;

import java.util.List;

public interface CollectionCaseMapper {
    void insertObjects(List<CollectionCase> collectionCases);

    void deleteColByColId(String colId);

    List<CollectionCaseVo> selectColCasesByColId(String colId);
}