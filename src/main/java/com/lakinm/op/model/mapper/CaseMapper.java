package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.CaseDTO;
import com.lakinm.op.model.entity.Case;

import java.util.List;

public interface CaseMapper {
    void insertCase(Case nCase);

    void updateCase(Case nCase);

    void deleteCaseById(String id);

    CaseDTO selectCaseDetailById(String caseId);

    List<CaseDTO> selectAllCases(String projectId, String caseType, String moduleId, String condition);
}