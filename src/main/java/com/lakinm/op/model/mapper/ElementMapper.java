package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.ElementDTO;
import com.lakinm.op.model.entity.Element;

import java.util.List;

public interface ElementMapper {
    void insertElement(Element element);

    void updateElement(Element element);

    void deleteElementById(String id);

    void updateElementStatusById(String id);

    List<Element> selectElementByProIdAndModId(String projectId, String moduleId);

    List<ElementDTO> selectElementByCondition(String moduleId, String projectId, String condition);

    Element selectElementDetailById(String id);

    ElementDTO getElementByIds(String eleId);
}