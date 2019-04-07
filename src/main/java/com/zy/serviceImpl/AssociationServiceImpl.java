package com.zy.serviceImpl;

import com.zy.dto.AssociationTypeDto;
import com.zy.entity.Type;
import com.zy.mapper.AssociationTypeMapper;
import com.zy.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AssociationServiceImpl implements AssociationService {
    @Autowired
    AssociationTypeMapper associationTypeMapper;

    @Override
    public AssociationTypeDto queryAll(Integer pageNum, Integer pageSize) {
        AssociationTypeDto associationTypeDto = new AssociationTypeDto();
        associationTypeDto.setTotal(associationTypeMapper.selectCount(new Type()));
        associationTypeDto.setRows(associationTypeMapper.queryAll(pageNum, pageSize));

        return associationTypeDto;
    }


}
