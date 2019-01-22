package com.zy.controller;

import com.zy.entity.Admin;
import com.zy.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;


    @RequestMapping("login")
    public Object login(Admin admin, HttpSession session) {
        System.out.println(admin);
        return adminService.loign(admin, session);
    }


//    @RequestMapping("ImageAction")
//    public String createImage(HttpSession session, HttpServletResponse response) throws Exception {
//
//        CreateValidateCode cvc = new CreateValidateCode();
//        String code = cvc.getCode();
//        //存入session作用
//        session.setAttribute("code", code);
//        cvc.write(response.getOutputStream());
//
//        return null;
//    }
}
