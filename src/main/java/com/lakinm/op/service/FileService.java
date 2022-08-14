package com.lakinm.op.service;

import com.lakinm.op.model.dto.TestFileDTO;
import com.lakinm.op.model.entity.TestFile;
import com.lakinm.op.model.vo.UserVo;
import com.lakinm.op.request.QueryRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface FileService {
    List<TestFileDTO> getFileList(QueryRequest queryRequest);

    void deleteTestFile(String fileId);

    void uploadFile(TestFile testFile, UserVo user, MultipartFile file);
}
