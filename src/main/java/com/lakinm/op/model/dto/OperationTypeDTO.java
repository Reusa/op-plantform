package com.lakinm.op.model.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class OperationTypeDTO implements Serializable {

    private Integer id;

    private String name;

    private String label;
}
