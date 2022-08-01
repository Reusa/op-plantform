package com.lakinm.op.controller;

import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.MenuListRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.MenuService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Autowired
    private UserService userService;

    @GetMapping("/listTest")
    public Result menuListTest(@RequestBody MenuListRequest menuList) {
        return menuService.getMenuList(menuList.getUserId(), menuList.getProjectId());
    }

    @GetMapping("/list")
    public Result menuList(@RequestHeader(value = "token") String token) {
        UserVo userVo = userService.checkToken(token);
        String userId = userVo.getId();
        String projectId = userVo.getLastProject();
        return menuService.getMenuList(userId, projectId);
    }
}
