package com.zy.controller;

import com.zy.entity.User;
import com.zy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("queryUserByAssociation")
    public List<User> queryUserByAssociation(Integer aid) {
        return userService.queryUserByAssociation(aid);
    }

}
