package com.zy.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @Id
    @Excel(name = "ID")
    private Integer id;
    @Excel(name = "学号")
    private Integer studentNumber;
    @Excel(name = "密码")
    private String password;
    @Excel(name = "盐")
    private String salt;
    @Excel(name = "姓名")
    private String name;
    @Excel(name = "电话")
    private Integer phone;
    @Excel(name = "性别")
    private String sex;
    @Excel(name = "头像地址")
    private String headPic;
    //学院
    @Excel(name = "学院")
    private String college;
    //专业
    @Excel(name = "专业")
    private String major;
    //职位
    @Excel(name = "职位")
    private String position;
    @Excel(name = "职位介绍")
    private String positionSynopsis;
}
