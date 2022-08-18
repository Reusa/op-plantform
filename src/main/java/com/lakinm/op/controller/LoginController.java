package com.lakinm.op.controller;

import com.alibaba.fastjson.JSONObject;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.JwtUtils;
import com.lakinm.op.model.dto.UserDTO;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.LoginRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
@RestController
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("/login")
    public Result login(@RequestBody LoginRequest loginRequest, HttpServletResponse servletResponse) {
        UserDTO userDTO = userService.getUser(loginRequest.getAccount());
        if (userDTO != null) {
            if (userDTO.getPassword().equals(loginRequest.getPassword())) {
                String token = JwtUtils.createWebToken(userDTO);
                System.out.println(token);
                servletResponse.addHeader("token", token);
                userDTO.setPassword(null);
                userDTO.setPermissions(userService.getUserProjectPermission(userDTO.getId(), userDTO.getLastProject()));
                UserVo userVo = new UserVo();
                BeanUtils.copyProperties(userDTO, userVo);
                //  用户存redis
                String redisUser = JSONObject.toJSONString(userVo);
                try {
                    redisTemplate.opsForValue().set(token, redisUser, 1, TimeUnit.HOURS);
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                    return Result.fail(500, "登录失败");
                }

                return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), userVo);
            } else {
                return Result.fail(ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getCode(), ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getMessage());
            }
        } else {
            return Result.fail(ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getCode(), ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getMessage());
        }
    }

    @PostMapping("/register")
    public Result register() {
        return Result.fail(500, "未开放注册");
    }

}
