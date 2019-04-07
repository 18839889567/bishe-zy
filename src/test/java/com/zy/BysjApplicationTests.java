package com.zy;

import com.zy.entity.AdminRole;
import com.zy.entity.Type;
import com.zy.mapper.AdminRoleMapper;
import com.zy.service.TypeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BysjApplicationTests {
    @Autowired
    RedisTemplate redisTemplate;
    @Autowired
    AdminRoleMapper adminRoleMapper;
    @Autowired
    TypeService typeService;

    @Test
    public void type() {
        Type type = new Type();
        type.setGenre("理论研究");

        System.out.println(typeService.compare(type));
    }


    @Test
    public void user() {
        List<AdminRole> adminRoles = adminRoleMapper.selectAll();
        for (AdminRole adminRole : adminRoles) {

            System.out.println(adminRole);
        }
    }
    @Test
    public void contextLoads() {
        ValueOperations valueOperations = redisTemplate.opsForValue();
//        Integer o = Integer.parseInt((String)valueOperations.get("221"));
//        System.out.println(o+1);

        //b309985508b760cd4ee5290ad480c7d2
        valueOperations.set("22", String.valueOf(1));

    }

}

