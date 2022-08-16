package com.lakinm.op.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.lakinm.op.common.exception.DuplicateContentException;
import com.lakinm.op.model.dto.FunctionDTO;
import com.lakinm.op.model.entity.Function;
import com.lakinm.op.model.entity.User;
import com.lakinm.op.model.mapper.FunctionMapper;
import com.lakinm.op.model.vo.FunctionVo;
import com.lakinm.op.service.FunctionService;
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
public class FunctionServiceImpl implements FunctionService {

    @Autowired
    private UserService userService;

    @Autowired
    private FunctionMapper functionMapper;

    @Override
    public void saveFunction(FunctionVo functionVo, String token) {
        String userId = userService.checkToken(token).getId();
        Function function = new Function();
        if (functionVo.getParam() != null) {
            JSONArray param = JSONArray.parseArray(functionVo.getParam());
            function.setParam(param.toJSONString());
        }

        function.setName(functionVo.getName());
        function.setFrom(functionVo.getFrom());
        function.setCode(functionVo.getCode());
        function.setExpression(functionVo.getExpression());
        function.setDescription(functionVo.getDescription());
        function.setProjectId(functionVo.getProjectId());

        // id为空时新增，否则更新
        if (functionVo.getId().equals("") || functionVo.getId() == null) {
            Function oldFunction = functionMapper.selectFunctionByName(functionVo.getName());
            if (oldFunction != null) {
                throw new DuplicateContentException("函数名存在重复");
            }
            function.setId(UUID.randomUUID().toString());
            function.setCreateTime(System.currentTimeMillis());
            function.setUpdateTime(System.currentTimeMillis());
            function.setCreateUser(userId);
            function.setUpdateUser(userId);


            functionMapper.insertFunction(function);
        } else {
            function.setId(functionVo.getId());
            function.setUpdateTime(System.currentTimeMillis());
            function.setUpdateUser(userId);

            functionMapper.updateFunction(function);
        }
    }

    @Override
    public void deleteFunction(String functionId) {
        functionMapper.deleteFunctionById(functionId);
    }

    @Override
    public FunctionVo findFunctionDetail(String functionId) {
        Function function = functionMapper.findFunctionDetailById(functionId);
        FunctionVo functionVo = new FunctionVo();
        BeanUtils.copyProperties(function, functionVo);
        return functionVo;
    }

    @Override
    public List<FunctionVo> getFunctionList(String condition, String projectId) {
        if (!condition.equals("") && condition != null) {
            condition = "%" + condition + "%";
        }
        List<FunctionDTO> functionDTOs = functionMapper.getFunctionList(condition, projectId);
        List<FunctionVo> functionVos = new ArrayList<>();
        for (FunctionDTO f : functionDTOs) {
            FunctionVo temp = new FunctionVo();
            temp.setId(f.getId());
            temp.setName(f.getName());
            temp.setFrom(f.getFrom());
            temp.setExpression(f.getExpression());
            temp.setDescription(f.getDescription());
            temp.setUsername(f.getUsername());
            temp.setUpdateTime(f.getUpdateTime());
            functionVos.add(temp);
        }
        return functionVos;
    }
}
