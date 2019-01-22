package com.zy.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;

@Table
@AllArgsConstructor
@NoArgsConstructor
public class user {
    @Id
    private Integer id;
    private Integer studentNumber;
    private String password;
    private String salt;
    private String name;
    private Integer phone;
    private String sex;
    private String headPic;
    //学院
    private String college;
    //专业
    private String major;
    //职业
    private String position;
}
