package com.lakinm.op.service.impl;

import com.lakinm.op.model.dto.UserDTO;
import com.lakinm.op.model.mapper.PermissionMapper;
import com.lakinm.op.model.mapper.UserMapper;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public UserDTO getUser(String account) {
        return userMapper.findUserByAccount(account);
    }

    @Override
    public List<String> getUserProjectPermission(String userId, String projectId) {
        return permissionMapper.findUserProjectPermission(userId, projectId);
    }
}
