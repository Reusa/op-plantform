package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.CaseWebDTO;
import com.lakinm.op.model.entity.CaseWeb;
import com.lakinm.op.model.entity.CaseWebWithBLOBs;

import java.util.List;

public interface CaseWebMapper {
    void deleteWebByCaseId(String id);

    void insertWebCase(List<CaseWeb> caseWebs);

    List<CaseWebDTO> selectCaseWebs(String caseId);
}