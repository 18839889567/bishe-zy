package com.zy.serviceImpl;

import com.zy.dto.AdminDto;
import com.zy.dto.error;
import com.zy.entity.Admin;
import com.zy.entity.AdminRole;
import com.zy.mapper.AdminMapper;
import com.zy.mapper.AdminRoleMapper;
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
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Autowired
    AdminRoleMapper adminRoleMapper;


    @Override
    public Object loign(Admin admin, HttpSession session) {

        if (admin.getPassword() == null || admin.getUsername() == null) {
            return new error("-200", "参数不全");
        } else {
            Subject subject = SecurityUtils.getSubject();
            AuthenticationToken token = new UsernamePasswordToken(admin.getUsername(), admin.getPassword());
            try {
                subject.login(token);

                session.setAttribute("name", admin.getUsername());
                return "admin/main/main";
            } catch (UnknownAccountException e) {
                return new error("-200", "用户名不存在");
            } catch (IncorrectCredentialsException e) {
                return new error("-200", "密码不存在");
            }
        }
    }

    @Override
    public List<AdminDto> queryAdmin() {
        return adminMapper.queryAdmin();
    }

    @Override
    public void deleteOne(Admin admin) {
        adminMapper.delete(admin);
        AdminRole adminRole = new AdminRole();
        adminRole.setAdminId(admin.getId());
        adminRoleMapper.delete(adminRole);
    }

    @Override
    public void insert(Admin admin) {
        adminMapper.insert(admin);
        AdminRole adminRole = new AdminRole();
        adminRole.setAdminId(admin.getId());
        adminRole.setRoleId(1);
        adminRoleMapper.insert(adminRole);
    }

    @Override
    public void save(Admin admin) {
        adminMapper.updateByPrimaryKey(admin);
    }
}
