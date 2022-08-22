package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.Element;
import lombok.Data;

import java.io.Serializable;

@Data
public class ElementDTO extends Element implements Serializable {
    private String moduleName;

    private String username;
}
