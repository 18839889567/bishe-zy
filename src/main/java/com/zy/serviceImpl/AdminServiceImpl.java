package com.zy.serviceImpl;

import com.zy.dto.error;
import com.zy.entity.Admin;
import com.zy.mapper.AdminMapper;
import com.zy.service.AdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Object loign(Admin admin, HttpSession session) {

        if (admin.getPassword() == null || admin.getName() == null) {
            return new error("-200", "参数不全");
        } else {
            Subject subject = SecurityUtils.getSubject();
            AuthenticationToken token = new UsernamePasswordToken(admin.getName(), admin.getPassword());
            try {
                subject.login(token);

                session.setAttribute("name", adminMapper.selectOne(admin).getName());
                return "admin/main/main";
            } catch (UnknownAccountException e) {
                return new error("-200", "用户名不存在");
            } catch (IncorrectCredentialsException e) {
                return new error("-200", "密码不存在");
            }
        }
    }
}
