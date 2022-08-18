package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.EngineDTO;
import com.lakinm.op.model.entity.Engine;

import java.util.List;

public interface EngineMapper {

    Engine selectEngineByName(String projectId, String name);

    void saveEngine(Engine newEngine);

    void deleteEngineById(String id);

    EngineDTO getEngineById(String id);

    List<Engine> selectEngineByProjectId(String projectId);

    List<EngineDTO> selectEngineList(String projectId, String condition);
}