package com.lakinm.op.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.lakinm.op.common.enums.ResultEnum;
import com.lakinm.op.common.utils.PageUtils;
import com.lakinm.op.model.vo.CollectionVo;
import com.lakinm.op.request.CollectionRequest;
import com.lakinm.op.request.QueryRequest;
import com.lakinm.op.response.Result;
import com.lakinm.op.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/collection")
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

    @PostMapping("/add")
    public Result addCollection(@RequestHeader(value = "token") String token, @RequestBody CollectionRequest request) {
        return collectionService.addCollection(token, request);
    }

    @GetMapping("/delete")
    public Result deleteCollection(@RequestParam String colId) {
        return collectionService.deleteCol(colId);
    }

    @GetMapping("/detail")
    public Result collectionDetail(@RequestParam String colId) {
        return collectionService.getColDetail(colId);
    }

    @PostMapping("/getCollectionList")
    public Result getCollectionList(@RequestBody QueryRequest request) {
        int page = request.getPage();
        int pageSize = request.getPageSize();
        Page<Object> po = PageHelper.startPage(page, pageSize, true);
        List<CollectionVo> collectionVos = collectionService.getColList(request);
        return Result.success(ResultEnum.SUCCESS.getCode(), ResultEnum.SUCCESS.getMessage(), PageUtils.setPageInfo(po, collectionVos));
    }
}
