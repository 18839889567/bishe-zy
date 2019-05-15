package com.zy.controller;

import com.zy.dto.AssociationTypeDto;
import com.zy.entity.Association;
import com.zy.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("association")
public class AssociationController {
    @Autowired
    AssociationService associationService;

    @RequestMapping("queryAll")
    public AssociationTypeDto queryAll(Integer page, Integer rows) {
        return associationService.queryAll(page, rows);
    }

    @RequestMapping("add")
    public void add(MultipartFile file, Association association) throws IOException {
        associationService.add(file, association);
    }

    @RequestMapping("remove")
    public void remove(Association association) {
        associationService.delete(association);
    }
}
