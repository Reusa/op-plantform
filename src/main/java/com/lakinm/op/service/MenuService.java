package com.lakinm.op.service;

import com.lakinm.op.response.Result;
import org.springframework.stereotype.Service;

@Service
public interface MenuService {

    Result getMenuList(String userId, String projectId);
}
