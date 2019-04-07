package com.zy.service;

import com.zy.entity.Type;

import java.util.List;

public interface TypeService {
    public List<Type> queryAllType();

    public String compare(Type type);

    public void insert(Type type);

    public void update(Type type);

    public void delete(Type type);
}
