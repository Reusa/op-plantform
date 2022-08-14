package com.lakinm.op.model.mapper;

import com.lakinm.op.model.dto.TestFileDTO;
import com.lakinm.op.model.entity.TestFile;

import java.util.List;

public interface TestFileMapper {

    List<TestFileDTO> selectFileList(String condition, String projectId);

    void deleteTestFileById(String fileId);

    void insertFile(TestFile testFile);
}