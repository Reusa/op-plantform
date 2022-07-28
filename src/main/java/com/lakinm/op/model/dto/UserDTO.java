package com.lakinm.op.model.dto;

import com.lakinm.op.model.entity.User;
import lombok.Data;

import java.util.List;

@Data
public class UserDTO extends User {
    private List<String> permissions;
}
