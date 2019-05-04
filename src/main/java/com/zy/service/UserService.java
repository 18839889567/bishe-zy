package com.zy.service;

import com.zy.entity.User;

import java.util.List;

public interface UserService {
    public List<User> queryUserByAssociation(Integer aid);

    public void addMember(User userAssociation);

    public void delete(User userAssociation);

    public void update(User userAssociation);
}
