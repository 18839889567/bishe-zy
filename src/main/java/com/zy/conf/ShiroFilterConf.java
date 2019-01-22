package com.zy.conf;


import com.zy.realm.MyRealm;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class ShiroFilterConf {
    //过滤器
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //提供安全管理器   用于认证授权
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        //多个过滤器  AnonymousFilter  匿名过滤器   anon   不拦截
        //     FormAuthenticationFilter 认证过滤器 authc  拦截
        Map<String, String> map = new HashMap<>();
        map.put("/view/user/login/index.jsp", "authc");
        map.put("/view/user/login/**", "authc");
        //设置入口页面位置
        shiroFilterFactoryBean.setLoginUrl("/view/user/login/login.jsp");
        //设置过滤器
        shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
        return shiroFilterFactoryBean;
    }

    @Bean
    public SecurityManager getSecurityManager(CacheManager cacheManager, Realm realm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //设置缓存
        securityManager.setCacheManager(cacheManager);
        //提供自动以 realm 做认证授权
        securityManager.setRealm(realm);
        return securityManager;
    }

    //缓存
    @Bean
    public CacheManager getCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        return ehCacheManager;
    }

    //自定义 Realm 获取数据库中的数据
    @Bean
    public Realm getRealm(CredentialsMatcher credentialsMatcher) {
        MyRealm myRealm = new MyRealm();
        myRealm.setCredentialsMatcher(credentialsMatcher);
        return myRealm;
    }

    //凭证匹配器
    @Bean
    public CredentialsMatcher getCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("md5");
        hashedCredentialsMatcher.setHashIterations(1024);
        return hashedCredentialsMatcher;
    }

}
