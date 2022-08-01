package com.lakinm.op.model.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class UserVo implements Serializable {

    private String id;

    private String username;

    private String account;

    private Long mobile;

    private String email;

    private String lastProject;

    private List<String> permissions;
}
