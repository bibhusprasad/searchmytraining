package com.searchmytraining.service;

import com.searchmytraining.entity.RoleEntity;

public interface ICommonService {
	
	public RoleEntity getRoleByUserId(Long userId);
	public boolean verifyEmail(String username,String uuid);

}
