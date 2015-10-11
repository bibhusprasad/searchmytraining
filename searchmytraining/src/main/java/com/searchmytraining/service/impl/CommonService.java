package com.searchmytraining.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.entity.RoleEntity;
import com.searchmytraining.service.ICommonService;

@Service
public class CommonService implements ICommonService {

	@Autowired
	private RoleDAO role;
	
	@Override
	public RoleEntity getRoleByUserId(Long userId) {
		return role.getRoleByUserId(userId);
	}

	@Override
	public boolean verifyEmail(String username, String uuid) {
		
		return false;
	}
}
