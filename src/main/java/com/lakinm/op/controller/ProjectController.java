package com.lakinm.op.controller;

import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ProjectService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @GetMapping("/userProject")
    public Result getUserProjects(@RequestHeader(value = "token") String token) {
        UserVo userVo = userService.checkToken(token);
        String userId = userVo.getId();
        return projectService.getUserProjects(userId);
    }
}
