package com.lakinm.op.response;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Result {

    private Boolean success;

    private Integer code;

    private String msg;

    private Object data;

    public Result() {
    }

    public Result(Boolean success, Integer code, String msg, Object data) {
        this.success = success;
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static Result success(Integer code, String msg, Object data) {
        return new Result(true, code, msg, data);
    }

    public static Result fail(Integer code, String msg, Object data) {
        return new Result(false, code, msg, data);
    }

    public static Result fail(Integer code, String msg) {
        return new Result(false, code, msg, null);
    }
}
