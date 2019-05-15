package com.zy.serviceImpl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.ExcelImportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.ImportParams;
import com.zy.entity.Province;
import com.zy.entity.User;
import com.zy.entity.UserAssociation;
import com.zy.mapper.UserAssociationMapper;
import com.zy.mapper.UserMapper;
import com.zy.service.UserService;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserAssociationMapper userAssociationMapper;

    @Override
    public List<User> queryUserByAssociation(Integer aid) {
        return userMapper.queryUserByAssociation(aid);
    }

    @Override
    public List<User> queryUserByStatus(Integer aid) {
        return userMapper.queryUserByStatus(aid);
    }

    @Override
    public void addMember(User userAssociation) {
        userMapper.insert(userAssociation);
    }

    @Override
    public void delete(User userAssociation) {
        userMapper.delete(userAssociation);
    }

    @Override
    public void update(User userAssociation) {
        userMapper.updateByPrimaryKey(userAssociation);
    }


    @Override
    public Map<String, List<Province>> queryProvince(String associationId) {
        HashMap<String, List<Province>> map = new HashMap<>();
        map.put("female", userMapper.selectProvinceFemale(associationId));
        map.put("male", userMapper.selectProvinceMale(associationId));
        map.put("all", userMapper.selectProvinceAll(associationId));
        return map;
    }

    @Override
    public void downloadUser(HttpSession session, Integer aid) {
        ServletContext ctx = session.getServletContext();
        String realPath = ctx.getRealPath("/excel");
        List<User> users = userMapper.queryUserByAssociation(aid);
        if (aid == 107) {
            users.remove(0);
        }
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("用户表", "User"), User.class, users);
        try {
            workbook.write(new FileOutputStream(new File(realPath + "/" + aid + "社团用户user.xls")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void poiImportUser(HttpSession session, MultipartFile file, Integer aid) {

        ServletContext ctx = session.getServletContext();
        String realPath = ctx.getRealPath("/excel");
        ImportParams params = new ImportParams();
        params.setTitleRows(1);   //表格标题行数
        params.setHeadRows(1);   //表头行数
        System.out.println(file.getOriginalFilename());
        List<User> list = ExcelImportUtil.importExcel(new File(realPath + "/" + file.getOriginalFilename()), User.class, params);
        for (User user : list) {
            UserAssociation userAssociation = new UserAssociation();
            userAssociation.setUserId(user.getId());
            userAssociation.setAssociationId(aid);
            userAssociation.setStatus(1);
            System.out.println(user);
            System.out.println(userAssociation + "zzzzzzzzzzzzzzzzzzzzzz");
            List<UserAssociation> select = userAssociationMapper.select(userAssociation);
            if (select.size() == 0) {
                System.out.println(userAssociation + "++++++++++++++");
                // userAssociationMapper.insert(userAssociation);
            }
        }
    }

    @Override
    public User queryOneUser(User user) {
        return userMapper.selectOne(user);
    }

    @Override
    public User login(User user) {
        return null;
    }

    @Override
    public User regist(User user) {
        return null;
    }


}
