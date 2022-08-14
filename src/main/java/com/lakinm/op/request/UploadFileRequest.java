package com.lakinm.op.request;

import lombok.Data;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
public class UploadFileRequest implements Serializable {

    private String fileName;
    private String projectId;
    private String description;

}
