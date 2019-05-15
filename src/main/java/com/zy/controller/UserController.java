package com.zy.controller;

import com.zy.entity.Province;
import com.zy.entity.User;
import com.zy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("queryUserByAssociation")
    public List<User> queryUserByAssociation(Integer aid) {
        List<User> users = userService.queryUserByAssociation(aid);
        if (aid == 107) {
            users.remove(0);
        }
        return users;
    }

    @RequestMapping("queryUserByStatus")
    public List<User> queryUserByStatus(Integer aid) {
        return userService.queryUserByStatus(aid);
    }

    @RequestMapping("province")
    public Map<String, List<Province>> queryProvince(String associationId) {
        return userService.queryProvince(associationId);
    }

    @RequestMapping("downloadUser")
    public void downloadUser(HttpSession session, Integer aid) {
        userService.downloadUser(session, aid);
    }

    @RequestMapping("importUser")
    public void poiImportUser(HttpSession session, MultipartFile file, Integer aid) {
        userService.poiImportUser(session, file, aid);
    }

    @RequestMapping("queryOneUser")
    public void poiImportUser(User user) {
        userService.queryOneUser(user);
    }

    @RequestMapping("login")
    public void login(User user) {
        System.out.println(user + "uuuuuuuuuuuuuuuu");
        userService.queryOneUser(user);
    }
}
