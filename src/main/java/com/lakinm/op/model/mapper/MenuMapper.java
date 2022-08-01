package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.MenuDTO;
import com.lakinm.op.model.entity.Menu;

import java.util.List;

public interface MenuMapper {

    List<MenuDTO> findAllMenus();
}