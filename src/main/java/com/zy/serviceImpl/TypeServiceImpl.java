package com.zy.serviceImpl;

import com.zy.entity.Type;
import com.zy.mapper.AssociationTypeMapper;
import com.zy.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TypeServiceImpl implements TypeService {

    @Autowired
    AssociationTypeMapper associationTypeMapper;

    @Override
    public List<Type> queryAllType() {
        return associationTypeMapper.selectAll();
    }

    @Override
    public String compare(Type type) {
        if (associationTypeMapper.selectOne(type) == null) {
            return "ok";
        } else {
            return "error";
        }
    }

    @Override
    public void insert(Type type) {
        associationTypeMapper.insert(type);
    }

    @Override
    public void update(Type type) {
        associationTypeMapper.updateByPrimaryKey(type);
    }

    @Override
    public void delete(Type type) {
        associationTypeMapper.delete(type);
    }
}
