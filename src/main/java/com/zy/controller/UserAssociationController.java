package com.zy.controller;

import com.zy.entity.UserAssociation;
import com.zy.service.UserAssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("userAssociation")
public class UserAssociationController {
    @Autowired
    UserAssociationService userService;


    @RequestMapping("addMember")
    public void addMember(UserAssociation userAssociation) {
        userService.addMember(userAssociation);
    }

    @RequestMapping("delete")
    public void delete(UserAssociation userAssociation) {
        userService.delete(userAssociation);
    }

    @RequestMapping("update")
    public void update(UserAssociation userAssociation) {
        userService.update(userAssociation);
    }
}
