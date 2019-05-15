package com.zy.service;

import com.zy.entity.Province;
import com.zy.entity.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface UserService {
    public List<User> queryUserByAssociation(Integer aid);

    public List<User> queryUserByStatus(Integer aid);

    public void addMember(User userAssociation);

    public void delete(User userAssociation);

    public void update(User userAssociation);

    public Map<String, List<Province>> queryProvince(String associationId);

    public void downloadUser(HttpSession session, Integer aid);

    public void poiImportUser(HttpSession session, MultipartFile file, Integer aid);

    public User queryOneUser(User user);

    public User login(User user);

    public User regist(User user);
}
