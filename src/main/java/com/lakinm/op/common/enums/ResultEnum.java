package com.lakinm.op.common.enums;

public enum ResultEnum {
    SUCCESS(200, "成功"),
    FAILED(500, "系统错误，请联系管理员"),
    ERROR_ACCOUNT_OR_PASSWORD(0, "用户名或密码错误"),
    ;

    private Integer code;

    private String message;

    ResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
