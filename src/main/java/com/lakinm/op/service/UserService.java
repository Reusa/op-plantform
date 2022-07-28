package com.lakinm.op.service;

import com.lakinm.op.model.dto.UserDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public interface UserService {

    UserDTO getUser(String account);

    List<String> getUserProjectPermission(String userId, String projectId);
}
