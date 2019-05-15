package com.zy.serviceImpl;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.zy.dto.AssociationTypeDto;
import com.zy.entity.Association;
import com.zy.entity.Type;
import com.zy.mapper.AssociationMapper;
import com.zy.mapper.AssociationTypeMapper;
import com.zy.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
@Transactional
public class AssociationServiceImpl implements AssociationService {
    @Autowired
    AssociationTypeMapper associationTypeMapper;
    @Autowired
    AssociationMapper associationMapper;
    @Autowired
    private FastFileStorageClient fastFileStorageClient;
    @Override
    public AssociationTypeDto queryAll(Integer pageNum, Integer pageSize) {
        AssociationTypeDto associationTypeDto = new AssociationTypeDto();
        associationTypeDto.setTotal(associationTypeMapper.selectCount(new Type()));
        associationTypeDto.setRows(associationTypeMapper.queryAll(pageNum, pageSize));
        return associationTypeDto;
    }

    @Override
    public void add(MultipartFile file, Association association) throws IOException {

        StorePath path = fastFileStorageClient.uploadFile(file.getInputStream(), file.getSize(), ".jpg", null);
        System.out.println(path.getGroup() + "++++++" + path.getPath());
        association.setPicture(path.getGroup() + "," + path.getPath());
        associationMapper.insert(association);
        //http://192.168.245.136:23000/group1/M00/00/00/wKj1iFwj6ySAemI_AACWhhL3GRM94..jpg
    }

    @Override
    public void delete(Association association) {
        String[] split = association.getPicture().split(",");
        fastFileStorageClient.deleteFile(split[0], split[1]);
        associationMapper.delete(association);
    }


}
