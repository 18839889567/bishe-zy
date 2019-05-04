package com.zy.serviceImpl;

import com.alibaba.fastjson.JSONObject;
import com.zy.entity.Province;
import com.zy.entity.UserAssociation;
import com.zy.mapper.UserAssociationMapper;
import com.zy.service.UserAssociationService;
import io.goeasy.GoEasy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserAssociationServiceImpl implements UserAssociationService {
    @Autowired
    UserServiceImpl userService;

    @Autowired
    UserAssociationMapper userAssociationMapper;

    public void push(Integer AssociationId) {
        Map<String, List<Province>> province = userService.queryProvince(AssociationId.toString());
        String jsonString = JSONObject.toJSONString(province);
        GoEasy goEasy2 = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-2b66fbf505a54de1a1ca0b060dc1be20");
        goEasy2.publish("map", jsonString);
    }
    @Override
    public void addMember(UserAssociation userAssociation) {
        userAssociation.setId(userAssociation.getUserId());
        userAssociation.setStatus(1);
        userAssociationMapper.insert(userAssociation);
        push(userAssociation.getAssociationId());
    }

    @Override
    public void delete(UserAssociation userAssociation) {
        userAssociationMapper.delete(userAssociation);
        push(userAssociation.getAssociationId());
    }

    @Override
    public void updateByStatus(UserAssociation userAssociation) {
        userAssociationMapper.updateByStatus(userAssociation.getAssociationId(), userAssociation.getUserId());
        push(userAssociation.getAssociationId());
    }
    @Override
    public void update(UserAssociation userAssociation) {
        userAssociationMapper.updateByPrimaryKey(userAssociation);
    }


}
