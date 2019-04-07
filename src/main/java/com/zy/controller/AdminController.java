package com.zy.controller;

import com.zy.dto.AdminDto;
import com.zy.entity.Admin;
import com.zy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;


    @RequestMapping("login")
    public Object login(Admin admin, HttpSession session) {
        // System.out.println(admin);
        return adminService.loign(admin, session);
    }


    @RequestMapping("queryAdmin")
    @ResponseBody
    public List<AdminDto> queryAdmin() {
        return adminService.queryAdmin();
    }

    @RequestMapping("delete")
    @ResponseBody
    public void delete(Admin admin) {
        adminService.deleteOne(admin);
    }

    @RequestMapping("insert")
    @ResponseBody
    public void insert(Admin admin) {
        adminService.insert(admin);
    }

    @RequestMapping("update")
    @ResponseBody
    public void save(Admin admin) {
        System.out.println(admin);
        adminService.save(admin);
    }



}
