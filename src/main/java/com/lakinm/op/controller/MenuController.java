package com.lakinm.op.controller;

import com.lakinm.op.request.MenuListRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/list")
    public Result menuList(@RequestBody MenuListRequest menuList) {
        return menuService.getMenuList(menuList.getUserId(), menuList.getProjectId());
    }
}
