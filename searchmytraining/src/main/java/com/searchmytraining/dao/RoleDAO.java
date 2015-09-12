package com.searchmytraining.dao;

import com.searchmytraining.entity.RoleEntity;


public interface RoleDAO {
	
	public void setRoleToUser(RoleEntity role);
	public RoleEntity getRoleByUserId(Long userId);

}
