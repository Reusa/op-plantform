package com.lakinm.op.common.enums;

public enum ResultEnum {
    SUCCESS(200, "成功"),
    FAILED(500, "系统错误，请联系管理员"),
    ERROR_ACCOUNT_OR_PASSWORD(0, "用户名或密码错误"),

    USER_NOT_LOGIN(500, "用户未登录"),
    NO_TOKEN(500, "缺少token"),
    TOKEN_ERROR(500, "token异常"),

    ENGINE_EXIST(500, "引擎已存在"),

    SAME_PARAM_NAME(500, "参数名重复"),
    SAME_NAME(500, "名称重复")
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
