package com.zy.mapper;

import com.zy.entity.Province;
import com.zy.entity.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<com.zy.entity.User> {
    public List<User> queryUserByAssociation(Integer aid);

    public List<User> queryUserByStatus(Integer aid);

    public List<Province> selectProvinceMale(String associationId);

    public List<Province> selectProvinceFemale(String associationId);

    public List<Province> selectProvinceAll(String associationId);
}
