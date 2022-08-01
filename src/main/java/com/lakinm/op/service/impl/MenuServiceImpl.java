package com.lakinm.op.service.impl;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.MenuDTO;
import com.lakinm.op.model.entity.Menu;
import com.lakinm.op.model.entity.Permission;
import com.lakinm.op.model.mapper.MenuMapper;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.MenuService;
import com.lakinm.op.service.UserService;
import com.qiniu.util.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        List<MenuDTO> menus = menuMapper.findAllMenus();
        List<MenuDTO> fatherMenus = new ArrayList<>();
        List<MenuDTO> childMenus = new ArrayList<>();
        for (MenuDTO menu : menus) {
            if (StringUtils.isNullOrEmpty(menu.getParentMenu())) {
                fatherMenus.add(menu);
            } else {
                childMenus.add(menu);
            }
        }

        List<MenuDTO> finalMenus = new ArrayList<>();
        for (MenuDTO fm : fatherMenus){
            List<Menu> secMenus = new ArrayList<>();
            for (MenuDTO cm : childMenus) {
                if (fm.getCode().equals(cm.getParentMenu())) {
                    if (!permissions.contains(cm.getPermissionId())) {
                        continue;
                    }
                    Menu secMenu = new Menu();
                    BeanUtils.copyProperties(cm, secMenu);
                    secMenus.add(secMenu);
                }
            }
            fm.setMenus(secMenus);
            finalMenus.add(fm);
        }

        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), finalMenus);
    }
}
