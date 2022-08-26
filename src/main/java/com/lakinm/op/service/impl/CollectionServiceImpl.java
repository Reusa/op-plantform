package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.entity.Collection;
import com.lakinm.op.model.entity.CollectionCase;
import com.lakinm.op.model.mapper.CollectionCaseMapper;
import com.lakinm.op.model.mapper.CollectionMapper;
import com.lakinm.op.model.vo.CollectionCaseVo;
import com.lakinm.op.model.vo.CollectionVo;
import com.lakinm.op.request.CollectionRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CollectionService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    private UserService userService;

    @Autowired
    private CollectionMapper collectionMapper;

    @Autowired
    private CollectionCaseMapper collectionCaseMapper;

    @Override
    public Result addCollection(String token, CollectionRequest request) {
        String userId = userService.checkToken(token).getId();
        Collection collection = new Collection();
        collection.setName(request.getName());
        collection.setVersionId(request.getVersionId());
        collection.setDescription(request.getDescription());
        collection.setProjectId(request.getProjectId());
        collection.setUpdateTime(System.currentTimeMillis());
        collection.setUpdateUser(userId);
        if (request.getId() == null || request.getId().equals("")) {
            collection.setId(UUID.randomUUID().toString());
            collection.setCreateTime(System.currentTimeMillis());
            collection.setCreateUser(userId);
            collectionMapper.insertCollection(collection);
        } else {
            collection.setId(request.getId());
            collectionMapper.updateCollection(collection);
        }
        List<CollectionCase> collectionCases = new ArrayList<>();
        for (CollectionCase temp: request.getCollectionCases()) {
            CollectionCase collectionCase = new CollectionCase();
            collectionCase.setId(UUID.randomUUID().toString());
            collectionCase.setIndex(temp.getIndex());
            collectionCase.setCollectionId(collection.getId());
            collectionCase.setCaseId(temp.getCaseId());
            collectionCases.add(collectionCase);
        }
        if (collectionCases.size() > 0) {
            collectionCaseMapper.insertObjects(collectionCases);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), collection);
    }

    @Override
    public Result deleteCol(String colId) {
        collectionMapper.deleteColById(colId);
        collectionCaseMapper.deleteColByColId(colId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getColDetail(String colId) {
        CollectionVo collectionVos = collectionMapper.selectColDetailById(colId);
        List<CollectionCaseVo> collectionCaseVos = collectionCaseMapper.selectColCasesByColId(colId);
        collectionVos.setCollectionCases(collectionCaseVos);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), collectionVos);
    }

    @Override
    public List<CollectionVo> getColList(QueryRequest request) {
        String projectId = request.getProjectId();
        String condition = request.getCondition();
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        return collectionMapper.selectCollectionListByCondition(projectId, condition);
    }
}
