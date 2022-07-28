package com.lakinm.op.service.impl;

import com.lakinm.op.model.entity.Menu;
import com.lakinm.op.model.entity.Permission;
import com.lakinm.op.model.mapper.MenuMapper;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.MenuService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private UserService userService;

    @Override
    public Result getMenuList(String userId, String projectId) {
        List<String> permissions = userService.getUserProjectPermission(userId, projectId);
        List<Menu> menus = menuMapper.findAllMenus();
//        List<Menu> fatherMenus =
        for (String permission : permissions){

        }

        return null;
    }
}
