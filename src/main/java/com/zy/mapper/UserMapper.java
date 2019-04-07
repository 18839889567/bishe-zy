package com.zy.mapper;

import com.zy.entity.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<com.zy.entity.User> {
    public List<User> queryUserByAssociation(Integer aid);
}
