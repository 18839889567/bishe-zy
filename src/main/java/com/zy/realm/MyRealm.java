package com.zy.realm;

import com.zy.entity.Admin;
import com.zy.entity.Limits;
import com.zy.entity.Power;
import com.zy.mapper.AdminMapper;
import com.zy.mapper.PowerMapper;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class MyRealm extends AuthorizingRealm {
    @Autowired
    AdminMapper adminMapper;
    @Autowired
    PowerMapper powerMapper;

    @Override  //授权
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //主体赋予 角色 权限   通过主体 查  角色   通过角色 查  权限
        String primaryPrincipal = (String) principalCollection.getPrimaryPrincipal();
        System.out.println("primaryPrincipal=" + primaryPrincipal);
        Power power = powerMapper.queryPowerByName(primaryPrincipal);

        System.out.println("power===========" + power);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.addRole(power.getName());
        for (Limits limit : power.getLimits()) {
            authorizationInfo.addStringPermission(limit.getName());
        }
        return authorizationInfo;
    }

    @Override  //认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String principal = (String) authenticationToken.getPrincipal();
        Admin admin = new Admin();
        admin.setUsername(principal);
        admin = adminMapper.selectOne(admin);
        AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(admin.getUsername(), admin.getPassword(), ByteSource.Util.bytes(admin.getSalt()), this.getName());
        return authenticationInfo;
    }

//    @Override  //认证
//    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
//        String principal = (String) authenticationToken.getPrincipal();
//        User user = new User();
//        user.setPhone(principal);
//        User user1 = userMapper.selectOne(user);
//        AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user1.getPhone(), user1.getPassword(), ByteSource.Util.bytes(user1.getSalt()), this.getName());
//        return authenticationInfo;
//    }
}
