package com.zy.serviceImpl;

import com.zy.entity.Province;
import com.zy.entity.User;
import com.zy.mapper.UserMapper;
import com.zy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

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

}
