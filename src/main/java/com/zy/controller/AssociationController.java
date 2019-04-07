package com.zy.controller;

import com.zy.dto.AssociationTypeDto;
import com.zy.service.AssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("association")
public class AssociationController {
    @Autowired
    AssociationService associationService;

    @RequestMapping("queryAll")
    public AssociationTypeDto queryAll(Integer page, Integer rows) {
        return associationService.queryAll(page, rows);
    }


}
