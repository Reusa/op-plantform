package com.lakinm.op.service.impl;

import com.lakinm.op.common.exception.DuplicateContentException;
import com.lakinm.op.model.dto.EnvironmentDTO;
import com.lakinm.op.model.entity.Environment;
import com.lakinm.op.model.mapper.EnvironmentMapper;
import com.lakinm.op.model.vo.EnvironmentVo;
import com.lakinm.op.request.EnvironmentRequest;
import com.lakinm.op.service.EnvironmentService;
import com.lakinm.op.service.UserService;
import org.apache.ibatis.javassist.bytecode.DuplicateMemberException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class EnvironmentServiceImpl implements EnvironmentService {

    @Autowired
    private EnvironmentMapper environmentMapper;

    @Autowired
    private UserService userService;

    @Override
    public void addEnvironment(String token, EnvironmentRequest request) {
        String userId = userService.checkToken(token).getId();
        Environment oldEnv = environmentMapper.findEnvByName(request.getProjectId(), request.getName());
        if (oldEnv != null && !Objects.equals(oldEnv.getId(), request.getId())) {
            throw new DuplicateContentException("环境名已存在");
        }
        Environment env = new Environment();
        env.setName(request.getName());
        env.setDescription(request.getDescription());
        env.setProjectId(request.getProjectId());

        if (request.getId().equals("") || request.getId() == null) {
            env.setId(UUID.randomUUID().toString());
            env.setCreateUser(userId);
            env.setCreateTime(System.currentTimeMillis());
            env.setUpdateUser(userId);
            env.setUpdateTime(System.currentTimeMillis());
            environmentMapper.insertEnvironment(env);
        } else {
            env.setId(request.getId());
            env.setUpdateUser(userId);
            env.setUpdateTime(System.currentTimeMillis());
            environmentMapper.updateEnvironmentById(env);
        }
    }

    @Override
    public void deleteEnvironment(String id) {
        environmentMapper.deleteEnvById(id);
    }

    @Override
    public List<Environment> getAllEnvironment(String projectId) {
        return environmentMapper.findEnvByProjectId(projectId);
    }

    @Override
    public List<EnvironmentVo> getEnvironmentList(String projectId, String condition) {
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        List<EnvironmentDTO> envDTO = environmentMapper.findEnvByCondition(projectId, condition);
        List<EnvironmentVo> envVO = new ArrayList<>();
        for (EnvironmentDTO temp : envDTO) {
            EnvironmentVo voTemp = new EnvironmentVo();
            voTemp.setId(temp.getId());
            voTemp.setName(temp.getName());
            voTemp.setDescription(temp.getDescription());
            voTemp.setProjectId(temp.getProjectId());
            voTemp.setUsername(temp.getUsername());
            voTemp.setUpdateTime(temp.getUpdateTime());
            envVO.add(voTemp);
        }
        return envVO;
    }
}
