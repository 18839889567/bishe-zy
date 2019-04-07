package com.zy.mapper;

import com.zy.dto.AdminDto;
import com.zy.entity.Admin;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AdminMapper extends Mapper<Admin> {
    public List<AdminDto> queryAdmin();
}
