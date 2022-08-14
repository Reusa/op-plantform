package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.common.utils.Pager;
import com.lakinm.op.model.dto.TestFileDTO;
import com.lakinm.op.model.entity.TestFile;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.request.UploadFileRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.FileService;
import com.lakinm.op.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @Autowired
    private UserService userService;

    @PostMapping("/list")
    public Result fileList(@RequestHeader String token, @RequestBody QueryRequest queryRequest) {
        int page = queryRequest.getPage();
        int pageSize = queryRequest.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<TestFileDTO> testFileDTOS = fileService.getFileList(queryRequest);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, testFileDTOS));
    }

    @PostMapping("/delete")
    public Result deleteTestFile(@RequestBody TestFile testFile) {
        String fileId = testFile.getId();
        fileService.deleteTestFile(fileId);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }

    @PostMapping("/upload")
    public Result uploadFile(@RequestHeader(value = "token") String token, @RequestBody UploadFileRequest request,
                             @RequestParam(value = "file", required=false) MultipartFile file) {
        UserVo user = userService.checkToken(token);
        String userId = user.getId();
        TestFile testFile = new TestFile();
        testFile.setName(request.getFileName());
        testFile.setProjectId(request.getProjectId());
        testFile.setDescription(request.getDescription());
        testFile.setCreateUser(userId);
        testFile.setUpdateUser(userId);
        fileService.uploadFile(testFile, user, file);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), null);
    }
}
