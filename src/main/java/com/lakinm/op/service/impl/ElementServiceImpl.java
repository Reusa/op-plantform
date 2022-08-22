package com.lakinm.op.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.dto.ElementDTO;
import com.lakinm.op.model.entity.Element;
import com.lakinm.op.model.mapper.ElementMapper;
import com.lakinm.op.model.vo.ElementVo;
import com.lakinm.op.request.ElementRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ElementService;
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
public class ElementServiceImpl implements ElementService {

    @Autowired
    private UserService userService;

    @Autowired
    private ElementMapper elementMapper;

    @Override
    public Result addElement(String token, ElementRequest request) {
        String userId = userService.checkToken(token).getId();
        Element element = new Element();
        element.setName(request.getName());
        element.setModuleId(request.getModuleId());
        element.setProjectId(request.getProjectId());
        element.setBy(request.getBy());
        element.setExpression(request.getExpression());
        element.setDescription(request.getDescription());
        element.setUpdateTime(System.currentTimeMillis());
        element.setUpdateUser(userId);
        if (request.getId() == null || request.getId().equals("")) {
            element.setId(UUID.randomUUID().toString());
            element.setCreateTime(System.currentTimeMillis());
            element.setCreateUser(userId);
            element.setStatus("Normal");
            elementMapper.insertElement(element);
        } else {
            element.setId(request.getId());
            elementMapper.updateElement(element);
        }
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), element);
    }

    @Override
    public Result deleteElement(String id) {
        elementMapper.updateElementStatusById(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getAllElement(String projectId, String moduleId) {
        if (projectId == null || projectId.equals("") || moduleId == null || moduleId.equals("")){
            return Result.fail(ResultEnum.LOST_PARAMS.getCode(), ResultEnum.LOST_PARAMS.getMessage());
        }
        List<Element> elements = elementMapper.selectElementByProIdAndModId(projectId, moduleId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), elements);
    }

    @Override
    public Result getElementList(QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        String moduleId = request.getModuleId();
        String projectId = request.getProjectId();
        String condition = request.getCondition();

        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        List<ElementDTO> elements = elementMapper.selectElementByCondition(moduleId, projectId, condition);
        List<ElementVo> elementVos = new ArrayList<>();
        for (ElementDTO et: elements) {
            ElementVo elementVo = new ElementVo();
            elementVo.setId(et.getId());
            elementVo.setName(et.getName());
            elementVo.setModuleId(et.getModuleId());
            elementVo.setModuleName(et.getModuleName());
            elementVo.setProjectId(et.getProjectId());
            elementVo.setBy(et.getBy());
            elementVo.setExpression(et.getExpression());
            elementVo.setDescription(et.getDescription());
            elementVo.setUserName(et.getUsername());
            elementVo.setUpdateTime(et.getUpdateTime());
            elementVos.add(elementVo);
        }
        Page<Object> po = PageHelper.startPage(page, pageSize, true);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, elementVos));
    }

    @Override
    public Result getDetail(String id) {
        Element element = elementMapper.selectElementDetailById(id);
        ElementVo elementVo = new ElementVo();
        BeanUtils.copyProperties(element, elementVo);

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), elementVo);
    }
}
