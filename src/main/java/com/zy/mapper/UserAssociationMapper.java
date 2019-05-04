package com.zy.mapper;

import com.zy.entity.UserAssociation;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface UserAssociationMapper extends Mapper<UserAssociation> {
    public void updateByStatus(@Param("associationId") int associationId, @Param("userId") int userId);
}
