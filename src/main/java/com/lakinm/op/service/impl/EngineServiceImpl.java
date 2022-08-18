package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.EngineStatus;
import com.lakinm.op.common.enums.EngineType;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.exception.DuplicateContentException;
import com.lakinm.op.model.dto.EngineDTO;
import com.lakinm.op.model.dto.TaskDTO;
import com.lakinm.op.model.entity.Engine;
import com.lakinm.op.model.mapper.EngineMapper;
import com.lakinm.op.model.mapper.TaskMapper;
import com.lakinm.op.model.vo.EngineVo;
import com.lakinm.op.request.EngineRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.EngineService;
import com.lakinm.op.service.TaskService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class EngineServiceImpl implements EngineService {

    @Autowired
    private UserService userService;

    @Autowired
    private EngineMapper engineMapper;

    @Autowired
    private TaskService taskService;

    @Override
    public Result addEngine(String token, EngineRequest request) {
        String userId = userService.checkToken(token).getId();
        Engine oldEngine = engineMapper.selectEngineByName(request.getProjectId(), request.getName());
        if (oldEngine != null) {
            return Result.fail(ResultEnum.ENGINE_EXIST.getCode(), ResultEnum.ENGINE_EXIST.getMessage());
        }
        Engine newEngine = new Engine();
        newEngine.setId(UUID.randomUUID().toString().replace("-", ""));
        newEngine.setName(request.getName());
        newEngine.setEngineType(EngineType.CUSTOM.toString());
        newEngine.setSecret(UUID.randomUUID().toString().replace("-", ""));
        newEngine.setStatus(EngineStatus.OFFLINE.toString());
        newEngine.setLastHeartbeatTime(null);
        newEngine.setProjectId(request.getProjectId());
        newEngine.setCreateUser(userId);
        newEngine.setCreateTime(System.currentTimeMillis());
        newEngine.setUpdateUser(userId);
        newEngine.setUpdateTime(System.currentTimeMillis());
        engineMapper.saveEngine(newEngine);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), newEngine);
    }

    @Override
    public Result deleteEngine(String id) {
        engineMapper.deleteEngineById(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getEngineDetail(String id) {
        EngineDTO engineDTO = engineMapper.getEngineById(id);
        List<TaskDTO> taskDTOS = taskService.getTaskListByEngineId(id);
        engineDTO.setTaskList(taskDTOS);
        EngineVo engineVo = new EngineVo();
        BeanUtils.copyProperties(engineDTO, engineVo);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), engineVo);
    }

    @Override
    public Result getEngines(String projectId) {
        List<Engine> engines = engineMapper.selectEngineByProjectId(projectId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), engines);
    }

    @Override
    public List<EngineVo> getEngineList(QueryRequest request) {
        String condition = request.getCondition();
        String projectId = request.getProjectId();
        if (condition != null && !condition.equals("")) {
            condition = "%"+ condition +"%";
        }
        List<EngineDTO> engineDTOS = engineMapper.selectEngineList(projectId, condition);
        List<EngineVo> engineVos = new ArrayList<>();
        for (EngineDTO dtoTemp : engineDTOS) {
            EngineVo voTemp = new EngineVo();
            voTemp.setId(dtoTemp.getId());
            voTemp.setName(dtoTemp.getName());
            voTemp.setSecret(dtoTemp.getSecret());
            voTemp.setStatus(dtoTemp.getStatus());
            voTemp.setEngineType(dtoTemp.getEngineType());
            voTemp.setUsername(dtoTemp.getUsername());
            voTemp.setCreateTime(dtoTemp.getCreateTime());
            engineVos.add(voTemp);
        }
        return engineVos;
    }
}
