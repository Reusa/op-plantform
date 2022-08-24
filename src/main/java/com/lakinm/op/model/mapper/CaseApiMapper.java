package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.CaseApiDTO;
import com.lakinm.op.model.entity.CaseApi;
import com.lakinm.op.model.entity.CaseApiWithBLOBs;

import java.util.List;

public interface CaseApiMapper {
    void deleteApiByCaseId(String id);

    void insertApiCase(List<CaseApi> caseApis);

    List<CaseApiDTO> selectCaseApis(String caseId);
}