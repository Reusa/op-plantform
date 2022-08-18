package com.lakinm.op.common.config;

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.exception.TokenExpireException;
import com.lakinm.op.common.exception.TokenVerifyException;
import com.lakinm.op.common.utils.JwtUtils;
import com.lakinm.op.model.vo.UserVo;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("token");
        String path = request.getServletPath();
        System.out.println(token);
        System.out.println(path);
        // 放过登录 注册的接口
        if (path.matches(Constant.LOGIN_PATH) || path.matches(Constant.REGISTER_PATH) || path.matches(Constant.REGISTER_CODE_PATH)) {
            return true;
        } else if (path.matches(Constant.ENGINE_PATH)) {
            return true;
        } else {
            if (token == null || token.equals("")) {
                outMessage(ResultEnum.NO_TOKEN.getCode(), ResultEnum.NO_TOKEN.getMessage(), request, response);
                throw new TokenVerifyException("token null");
            }
            DecodedJWT jwt = JwtUtils.verifyToken(token);
            System.out.println(jwt);
            return true;
        }
    }

    private void outMessage(Integer code, String message, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONObject object = new JSONObject();
        object.put("code", code);
        object.put("message", message);
        object.put("data", null);
        response.setContentType("application/json;charset=utf-8");
        ServletOutputStream pw = response.getOutputStream();
        pw.write(object.toJSONString().getBytes(StandardCharsets.UTF_8));
        pw.flush();
        pw.close();
    }


}
