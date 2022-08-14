package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.ParamData;
import com.lakinm.op.model.entity.ParamGroup;
import com.lakinm.op.model.vo.ParamDataVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommonParamMapper {
    List<ParamGroup> findParamGroupByPid(String projectId);

    void saveParamGroup(ParamGroup paramGroup);

    void deleteParamGroupById(String id);

    ParamData selectPatamDataById(String id);

    void saveParamData(ParamData paramData);

    void updateParamData(ParamData paramData);

    List<ParamData> findParamDataByGroupId(String groupId);

    void deleteParamDataById(String paramDataId);

    ParamData findParamDataByGroupIdAndName(String groupId, String name);
}
