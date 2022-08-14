package com.lakinm.op.service.impl;

import com.lakinm.op.model.dto.TestFileDTO;
import com.lakinm.op.model.entity.TestFile;
import com.lakinm.op.model.mapper.TestFileMapper;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.service.FileService;
import com.qiniu.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@Service
public class FileServiceImpl implements FileService {

//    public static final String filePath = "/abc";
    @Value("${test.file.path}")
    public String filePath;

    @Autowired
    private TestFileMapper testFileMapper;

    @Override
    public List<TestFileDTO> getFileList(QueryRequest queryRequest) {
        String condition = queryRequest.getCondition();
        String projectId = queryRequest.getProjectId();
        if (!StringUtils.isNullOrEmpty(condition)) {
            condition = "%" + condition + "%";
        }
        return testFileMapper.selectFileList(condition, projectId);
    }

    @Override
    public void deleteTestFile(String fileId) {
        testFileMapper.deleteTestFileById(fileId);
    }

    /**
     * 假文件上传功能
     * @param testFile
     * @param user
     * @param file
     */
    @Override
    public void uploadFile(TestFile testFile, UserVo user, MultipartFile file) {
        testFile.setId(UUID.randomUUID().toString().replace("-", ""));
        testFile.setCreateTime(System.currentTimeMillis());
        testFile.setUpdateTime(System.currentTimeMillis());

        testFile.setFilePath(filePath);
        testFileMapper.insertFile(testFile);
    }
}
