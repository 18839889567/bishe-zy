package com.zy.service;

import com.zy.dto.AdminDto;
import com.zy.entity.Admin;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AdminService {
    public Object loign(Admin admin, HttpSession session);

    public List<AdminDto> queryAdmin();

    public void deleteOne(Admin admin);

    public void insert(Admin admin);

    public void save(Admin admin);
    // public Object loign(String phone, String password, String code);
    public Admin queryOneAdmin(Admin admin);
}
