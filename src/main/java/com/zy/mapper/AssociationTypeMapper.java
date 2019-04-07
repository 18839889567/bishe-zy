package com.zy.mapper;

import com.zy.entity.Type;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AssociationTypeMapper extends Mapper<Type> {
    public List<Type> queryAll(@Param("page") int Page, @Param("pageSize") int pageSize);

    public List<Type> all();

    public List<Type> selectByFirstPage();

    public Type queryById(String id);


}
