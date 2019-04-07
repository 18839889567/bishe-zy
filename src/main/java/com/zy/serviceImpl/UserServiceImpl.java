package com.zy.serviceImpl;

import com.zy.entity.User;
import com.zy.mapper.UserMapper;
import com.zy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> queryUserByAssociation(Integer aid) {
        return userMapper.queryUserByAssociation(aid);
    }
}