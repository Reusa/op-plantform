package com.lakinm.op.controller;

import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.ProjectService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/addUserProject")
    public Result addUserProject(@RequestBody QueryRequest request) {
        String userId = request.getUserId();
        String projectId = request.getProjectId();
        return projectService.addUserProject(userId, projectId);
    }
}
