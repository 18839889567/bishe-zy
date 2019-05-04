package com.zy.serviceImpl;

import com.zy.entity.UserAssociation;
import com.zy.mapper.UserAssociationMapper;
import com.zy.service.UserAssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserAssociationServiceImpl implements UserAssociationService {


    @Autowired
    UserAssociationMapper userAssociationMapper;

    @Override
    public void addMember(UserAssociation userAssociation) {
        userAssociation.setId(userAssociation.getUserId());
        userAssociationMapper.insert(userAssociation);
    }

    @Override
    public void delete(UserAssociation userAssociation) {
        userAssociationMapper.delete(userAssociation);
    }

    @Override
    public void update(UserAssociation userAssociation) {
        userAssociationMapper.updateByPrimaryKey(userAssociation);
    }
}
