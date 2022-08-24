package com.lakinm.op.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.CaseApiDTO;
import com.lakinm.op.model.dto.CaseDTO;
import com.lakinm.op.model.dto.CaseWebDTO;
import com.lakinm.op.model.dto.ElementDTO;
import com.lakinm.op.model.entity.*;
import com.lakinm.op.model.mapper.CaseApiMapper;
import com.lakinm.op.model.mapper.CaseMapper;
import com.lakinm.op.model.mapper.CaseWebMapper;
import com.lakinm.op.model.mapper.ElementMapper;
import com.lakinm.op.model.vo.CaseVo;
import com.lakinm.op.request.*;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CaseService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

@Service
@Transactional(rollbackFor = Exception.class)
public class CaseServiceImpl implements CaseService {

    @Autowired
    private UserService userService;

    @Autowired
    private CaseMapper caseMapper;

    @Autowired
    private CaseApiMapper caseApiMapper;

    @Autowired
    private CaseWebMapper caseWebMapper;

    @Autowired
    private ElementMapper elementMapper;

    @Override
    public Result addCase(String token, CaseRequest request) {
        String userId = userService.checkToken(token).getId();
        Case nCase = new Case();
        nCase.setName(request.getName());
        nCase.setLevel(request.getLevel());
        nCase.setModuleId(request.getModuleId());
        nCase.setProjectId(request.getProjectId());
        nCase.setType(request.getType());
        nCase.setThirdParty(request.getThirdParty());
        nCase.setDescription(request.getDescription());
        nCase.setEnvironmentIds(request.getEnvironmentIds().toJSONString());
        nCase.setCommonParam(request.getCommonParam().toJSONString());
        nCase.setUpdateTime(System.currentTimeMillis());
        nCase.setUpdateUser(userId);
        if (request.getId() == null || request.getId().equals("")) {
            nCase.setId(UUID.randomUUID().toString());
            nCase.setCreateTime(System.currentTimeMillis());
            nCase.setCreateUser(userId);
            nCase.setStatus("Normal");
            caseMapper.insertCase(nCase);
        } else {
            nCase.setId(request.getId());
            caseMapper.updateCase(nCase);
        }
        // 根据类型创建关联的ApiCase表/WebCase表数据
        if (request.getType().equals("API")) {
            caseApiMapper.deleteApiByCaseId(nCase.getId());
            List<ApiCaseRequest> apiCaseRequests = request.getApiCases();
            List<CaseApi> caseApis = new ArrayList<>();
            for (ApiCaseRequest acr : apiCaseRequests) {
                CaseApi caseApi = new CaseApi();
                caseApi.setId(UUID.randomUUID().toString());
                caseApi.setIndex(acr.getIndex());
                caseApi.setCaseId(nCase.getId());
                caseApi.setApiId(acr.getApiId());
                caseApi.setHeader(acr.getHeader().toJSONString());
                caseApi.setBody(acr.getBody().toJSONString());
                caseApi.setQuery(acr.getQuery().toJSONString());
                caseApi.setRest(acr.getRest().toJSONString());
                caseApi.setAssertion(acr.getAssertion().toJSONString());
                caseApi.setRelation(acr.getRelation().toJSONString());
                caseApi.setController(acr.getController().toJSONString());
                caseApis.add(caseApi);
            }
            caseApiMapper.insertApiCase(caseApis);
        } else if (request.getType().equals("WEB")) {
            caseWebMapper.deleteWebByCaseId(nCase.getId());
            List<WebCaseRequest> webCaseRequests = request.getWebCases();
            List<CaseWeb> caseWebs = new ArrayList<>();
            for (WebCaseRequest wcr : webCaseRequests) {
                CaseWeb caseWeb = new CaseWeb();
                caseWeb.setId(UUID.randomUUID().toString());
                caseWeb.setIndex(wcr.getIndex());
                caseWeb.setCaseId(nCase.getId());
                caseWeb.setOperationId(wcr.getOperationId());
                caseWeb.setElement(wcr.getElement().toJSONString());
                caseWeb.setData(wcr.getData().toJSONString());
                caseWebs.add(caseWeb);
            }
            caseWebMapper.insertWebCase(caseWebs);
        } else {
            return Result.fail(ResultEnum.ERROR_PARAMS.getCode(), ResultEnum.ERROR_PARAMS.getMessage());
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result deleteCase(String id) {
        caseMapper.deleteCaseById(id);
        caseApiMapper.deleteApiByCaseId(id);
        caseWebMapper.deleteWebByCaseId(id);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @Override
    public Result getCaseDetail(String caseId, String caseType) {
        CaseDTO caseDTO = caseMapper.selectCaseDetailById(caseId);
        if (caseType.equalsIgnoreCase("API")) {
            List<CaseApiDTO> caseApis = caseApiMapper.selectCaseApis(caseId);
            caseDTO.setCaseApis(caseApis);
        } else if(caseType.equalsIgnoreCase("WEB")) {
            List<CaseWebDTO> caseWebs = caseWebMapper.selectCaseWebs(caseId);
            for (CaseWebDTO caseWebDto: caseWebs) {
                JSONArray elements = JSONArray.parseArray(caseWebDto.getElement());
                for(int i=0; i<elements.size(); i++) {
                    JSONObject element = elements.getJSONObject(i);
                    String elementId = element.getString("id");
                    ElementDTO elementDTO = elementMapper.getElementByIds(elementId);
                    element.put("by", elementDTO.getBy());
                    element.put("name", elementDTO.getName());
                    element.put("expression", elementDTO.getExpression());
                    element.put("moduleId", elementDTO.getModuleId());
                    element.put("moduleName", elementDTO.getModuleName());
                }
                caseWebDto.setElement(JSONArray.toJSONString(elements));
            }
            caseDTO.setCaseWebs(caseWebs);
        } else {
            return Result.fail(ResultEnum.ERROR_PARAMS.getCode(), ResultEnum.ERROR_PARAMS.getMessage());
        }
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), caseDTO);
    }

    @Override
    public List<CaseVo> getCaseList(QueryRequest request) {
        String projectId = request.getProjectId();
        String caseType = request.getCaseType();
        String moduleId = request.getModuleId();
        String condition = request.getCondition();
        if (condition != null && !condition.equals("")) {
            condition = "%" + condition + "%";
        }
        List<CaseDTO> caseDTOS = caseMapper.selectAllCases(projectId, caseType, moduleId, condition);
        List<CaseVo> caseVos = new ArrayList<>();
        for (CaseDTO temp : caseDTOS) {
            CaseVo caseVo = new CaseVo();
            BeanUtils.copyProperties(temp, caseVo);
            caseVos.add(caseVo);
        }
        return caseVos;
    }
}
