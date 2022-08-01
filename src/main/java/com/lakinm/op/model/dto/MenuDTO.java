package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.Menu;
import lombok.Data;

import java.util.List;

@Data
public class MenuDTO {

    private Long id;

    private String code;

    private String name;

    private String icon;

    private String path;

    private String parentMenu;

    private String permissionId;

    private List<Menu> menus;
}
