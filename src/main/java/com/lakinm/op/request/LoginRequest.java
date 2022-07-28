package com.lakinm.op.request;

import lombok.Data;

import java.io.Serializable;

@Data
public class LoginRequest implements Serializable {

    private String account;

    private String password;
}
