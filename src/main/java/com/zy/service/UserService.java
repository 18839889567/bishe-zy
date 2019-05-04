package com.zy.service;

import com.zy.entity.Province;
import com.zy.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<User> queryUserByAssociation(Integer aid);

    public List<User> queryUserByStatus(Integer aid);

    public void addMember(User userAssociation);

    public void delete(User userAssociation);

    public void update(User userAssociation);

    public Map<String, List<Province>> queryProvince(String associationId);

}
