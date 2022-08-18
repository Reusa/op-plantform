package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class OperationTypeVo implements Serializable {

    private Integer id;

    private String name;

    private String label;
}
