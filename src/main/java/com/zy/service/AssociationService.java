package com.zy.service;

import com.zy.dto.AssociationTypeDto;
import com.zy.entity.Association;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface AssociationService {
    public AssociationTypeDto queryAll(Integer pageNum, Integer pageSize);

    public void add(MultipartFile file, Association association) throws IOException;

    public void delete(Association association);
}
