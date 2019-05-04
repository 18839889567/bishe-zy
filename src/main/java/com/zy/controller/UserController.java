package com.zy.controller;

import com.zy.entity.Province;
import com.zy.entity.User;
import com.zy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("queryUserByAssociation")
    public List<User> queryUserByAssociation(Integer aid) {
        return userService.queryUserByAssociation(aid);
    }

    @RequestMapping("queryUserByStatus")
    public List<User> queryUserByStatus(Integer aid) {
        return userService.queryUserByStatus(aid);
    }

    @RequestMapping("province")
    public Map<String, List<Province>> queryProvince(String associationId) {
        return userService.queryProvince(associationId);
    }

}
