package com.lakinm.op.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.model.dto.UserDTO;
import com.lakinm.op.model.entity.User;
import com.lakinm.op.model.mapper.PermissionMapper;
import com.lakinm.op.model.mapper.UserMapper;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public UserDTO getUser(String account) {
        return userMapper.findUserByAccount(account);
    }

    @Override
    public List<String> getUserProjectPermission(String userId, String projectId) {
        return permissionMapper.findUserProjectPermission(userId, projectId);
    }

    @Override
    public UserVo checkToken(String token) {
        try {
            String user = (String) redisTemplate.opsForValue().get(token);
            UserVo userVo = JSONObject.parseObject(user, UserVo.class);
            if (userVo == null) {
                return null;
            }
            return userVo;
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return null;
        }
    }

    @Override
    public Result updateUserInfo(UserVo userVo) {
        User user = new User();
        user.setUsername(userVo.getUsername());
        user.setEmail(userVo.getEmail());
        user.setUpdateTime(System.currentTimeMillis());
        userMapper.updateUserInfoById(user);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }
}
