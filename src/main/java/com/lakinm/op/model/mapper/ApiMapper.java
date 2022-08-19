package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ApiDTO;
import com.lakinm.op.model.entity.Api;
import com.lakinm.op.model.entity.ApiWithBLOBs;
import com.lakinm.op.response.Result;

import java.util.List;

public interface ApiMapper {

    Api selectApiByName(String name, String projectId);

    void insertApi(Api saveApi);

    void updateApi(Api saveApi);

    Result deleteApiById(String id);

    ApiDTO selectApiById(String id);

    List<ApiDTO> selectApiList(String projectId, String moduleId, String condition);

    void updateApiToDelStatus(String id);
}