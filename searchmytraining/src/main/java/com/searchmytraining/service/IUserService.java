package com.searchmytraining.service;

import com.searchmytraining.entity.UserEntity;

public interface IUserService {
	
	public void addUser(UserEntity user);
	public Long getMaxUserId(String idcolumn);
	public UserEntity getUser(Long userId);
	public UserEntity getUser(String username);
	public void updateUserUUID(String username,String uuid);
	public boolean verifyEmail(String username, String uuid);
	String getUserRole(UserEntity usrEntity);
}
