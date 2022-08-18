package com.lakinm.op.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lakinm.op.common.exception.DataBlankException;
import com.lakinm.op.common.exception.DuplicateContentException;
import com.lakinm.op.model.dto.OperationDTO;
import com.lakinm.op.model.dto.OperationTypeDTO;
import com.lakinm.op.model.entity.Operation;
import com.lakinm.op.model.entity.OperationType;
import com.lakinm.op.model.mapper.OperationMapper;
import com.lakinm.op.model.mapper.OperationTypeMapper;
import com.lakinm.op.model.vo.OperationTypeVo;
import com.lakinm.op.model.vo.OperationVo;
import com.lakinm.op.service.OperationService;
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
public class OperationServiceImpl implements OperationService {

    @Autowired
    private OperationTypeMapper operationTypeMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private OperationMapper operationMapper;

    @Override
    public List<OperationTypeVo> getOperationTypeList() {
        return getOperationType();
    }

    @Override
    public void addOperation(String token, OperationVo operationVo) {
        String userId = userService.checkToken(token).getId();
        Operation operation = new Operation();
        if (operationVo.getElement() != null) {
            JSONArray element = JSONArray.parseArray(operationVo.getElement());
            operation.setElement(element.toJSONString());
        }
        if (operationVo.getData() != null) {
            JSONArray data = JSONArray.parseArray(operationVo.getData());
            operation.setData(data.toJSONString());
        }

        operation.setName(operationVo.getName());
        operation.setType(operationVo.getType());
        operation.setFrom(operationVo.getFrom());
        operation.setCode(operationVo.getCode());
        operation.setDescription(operationVo.getDescription());
        operation.setProjectId(operationVo.getProjectId());

        if (operationVo.getId().equals("") || operationVo.getId() == null) {
            Operation oldOperation = operationMapper.findOperationByName(operationVo.getName(), operationVo.getProjectId());
            if (oldOperation != null){
                throw new DuplicateContentException("控件名已存在");
            }
            operation.setId(UUID.randomUUID().toString());
            operation.setCreateUser(userId);
            operation.setCreateTime(System.currentTimeMillis());
            operation.setUpdateUser(userId);
            operation.setUpdateTime(System.currentTimeMillis());

            operationMapper.insertOperation(operation);
        } else {
            operation.setId(operationVo.getId());
            operation.setUpdateUser(userId);
            operation.setUpdateTime(System.currentTimeMillis());

            operationMapper.updateOperation(operation);
        }
    }

    @Override
    public void deleteOperation(String id) {
        operationMapper.deleteOperationById(id);
    }

    @Override
    public OperationVo getOperationDetail(String id) {
        Operation operation = operationMapper.findOperationById(id);
        OperationVo operationVo = new OperationVo();
        BeanUtils.copyProperties(operation, operationVo);
        return operationVo;
    }

    @Override
    public List<OperationVo> getOperationList(String condition, String projectId, String type) {
        if (type.equals("") || type == null) {
            throw new DataBlankException("控件类型为空");
        }
        if (!condition.equals("") && condition != null) {
            condition = "%" + condition + "%";
        }

        List<OperationDTO> operationDTOS = operationMapper.findAllOperation(condition, projectId, type);
        List<OperationVo> operationVos = new ArrayList<>();
        for (OperationDTO temp : operationDTOS) {
            OperationVo ov = new OperationVo();
            ov.setId(temp.getId());
            ov.setName(temp.getName());
            ov.setType(temp.getType());
            ov.setFrom(temp.getFrom());
            ov.setElement(temp.getElement());
            ov.setData(temp.getData());
            ov.setCode(temp.getCode());
            ov.setDescription(temp.getDescription());
            ov.setProjectId(temp.getProjectId());
            ov.setCreateUser(temp.getCreateUser());
            ov.setUpdateTime(temp.getUpdateTime());
            ov.setUsername(temp.getUsername());
            operationVos.add(ov);
        }
        return operationVos;
    }

    private List<OperationTypeVo> getOperationType() {
        List<OperationTypeDTO> operationTypes = operationTypeMapper.findAllOperationType();
        List<OperationTypeVo> operationTypeVos = new ArrayList<>();
        for (OperationTypeDTO temp : operationTypes) {
            OperationTypeVo otv = new OperationTypeVo();
            otv.setId(temp.getId());
            otv.setName(temp.getName());
            otv.setLabel(temp.getLabel());
            operationTypeVos.add(otv);
        }
        return operationTypeVos;
    }
}
