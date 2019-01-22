package com.zy.service;

import com.zy.entity.Admin;

import javax.servlet.http.HttpSession;

public interface AdminService {
    public Object loign(Admin admin, HttpSession session);
    // public Object loign(String phone, String password, String code);
}
