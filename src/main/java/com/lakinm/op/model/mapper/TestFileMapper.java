package com.lakinm.op.model.mapper;

import com.lakinm.op.model.entity.TestFile;

public interface TestFileMapper {
    int deleteByPrimaryKey(String id);

    int insert(TestFile record);

    int insertSelective(TestFile record);

    TestFile selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(TestFile record);

    int updateByPrimaryKey(TestFile record);
}