package com.zy.dto;

import com.zy.entity.Association;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDto {
    private Integer id;
    private String username;
    private String name;
    private String password;
    private Association association;
}
