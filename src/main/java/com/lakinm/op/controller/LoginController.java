package com.lakinm.op.controller;

import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.JwtUtils;
import com.lakinm.op.model.dto.UserDTO;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.LoginRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/user")
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody LoginRequest loginRequest, HttpServletResponse servletResponse) {
        UserDTO userDTO = userService.getUser(loginRequest.getAccount());
        if (userDTO != null) {
            if (userDTO.getPassword().equals(loginRequest.getPassword())) {
                servletResponse.addHeader("token", JwtUtils.createWebToken(userDTO));
                userDTO.setPassword(null);
                userDTO.setPermissions(userService.getUserProjectPermission(userDTO.getId(), userDTO.getLastProject()));
                UserVo userVo = new UserVo();
                BeanUtils.copyProperties(userDTO, userVo);
                return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), userVo);
            } else {
                return Result.fail(ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getCode(), ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getMessage());
            }
        } else {
            return Result.fail(ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getCode(), ResultEnum.ERROR_ACCOUNT_OR_PASSWORD.getMessage());
        }
    }

}
