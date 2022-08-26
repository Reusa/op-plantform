package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.Collection;
import com.lakinm.op.model.vo.CollectionVo;

import java.util.List;

public interface CollectionMapper {
    void insertCollection(Collection collection);

    void updateCollection(Collection collection);

    void deleteColById(String colId);

    CollectionVo selectColDetailById(String colId);

    List<CollectionVo> selectCollectionListByCondition(String projectId, String condition);
}