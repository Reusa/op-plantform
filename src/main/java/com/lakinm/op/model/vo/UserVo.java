package com.lakinm.op.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class UserVo {

    private String id;

    private String username;

    private String account;

    private Long mobile;

    private String email;

    private String lastProject;

    private List<String> permissions;
}
