package com.zy;

import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.zy.entity.AdminRole;
import com.zy.entity.Type;
import com.zy.mapper.AdminMapper;
import com.zy.mapper.AdminRoleMapper;
import com.zy.service.TypeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
    @Autowired
    AdminMapper adminMapper;


    @Test
    public void imp(HttpSession session) {
        ServletContext ctx = session.getServletContext();
        String realPath = ctx.getRealPath("/excel");
        ImportParams params = new ImportParams();
        params.setTitleRows(1);   //表格标题行数
        params.setHeadRows(2);   //表头行数
        System.out.println(realPath + "/user.xls");
//        List<User> list = ExcelImportUtil.importExcel(new File(realPath+"/user.xls"), User.class, params);
//        for (User user : list) {
//            System.out.println(user);
//
////            User user1 = userMapper.selectOne(user);
////            if (user1!=null){
////                userMapper.insert(user1);
////            }
//        }
    }

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

