package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.UserDTO;
import com.lakinm.op.model.entity.User;

public interface UserMapper {

    UserDTO findUserByAccount(String account);

    void updateUserInfoById(User user);
}