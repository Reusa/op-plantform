package com.lakinm.op.controller;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/info")
    public Result getUserInfo(@RequestHeader(value = "token") String token) {
        UserVo userVo = userService.checkToken(token);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), userVo);
    }

    @PostMapping("/edit/info")
    public Result editUserInfo(@RequestBody UserVo userVo) {
        return userService.updateUserInfo(userVo);
    }
}
