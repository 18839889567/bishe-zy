package com.zy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAssociation {
    private Integer id;
    private Integer associationId;
    private Integer userId;
    private Integer status;
}
