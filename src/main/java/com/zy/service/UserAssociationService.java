package com.zy.service;

import com.zy.entity.UserAssociation;

public interface UserAssociationService {

    public void addMember(UserAssociation userAssociation);

    public void delete(UserAssociation userAssociation);

    public void update(UserAssociation userAssociation);
}
