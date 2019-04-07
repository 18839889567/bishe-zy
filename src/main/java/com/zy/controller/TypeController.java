package com.zy.controller;

import com.zy.entity.Type;
import com.zy.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("type")
public class TypeController {
    @Autowired
    TypeService typeService;


    @RequestMapping("queryAllType")
    public List<Type> queryAllType() {
        return typeService.queryAllType();
    }

    @RequestMapping("compare")
    public String compare(Type type) {
        return typeService.compare(type);
    }

    @RequestMapping("insert")
    public void insert(Type type) {
        typeService.insert(type);
    }

    @RequestMapping("update")
    public void update(Type type) {
        typeService.update(type);
    }

    @RequestMapping("delete")
    public void delete(Type type) {
        typeService.delete(type);
    }

}
