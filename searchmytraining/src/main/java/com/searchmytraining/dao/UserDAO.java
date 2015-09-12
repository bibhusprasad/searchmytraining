package com.searchmytraining.dao;

import com.searchmytraining.entity.UserEntity;

public interface UserDAO {
	
	public void addUser(UserEntity entity);
	public Integer getMaxUserId(String idcolumn);
	public UserEntity getUser(Integer id);
	public UserEntity getUser(String username);
	public void updateUserUUID(String username,String uuid);
	public boolean verifyEmail(String username, String uuid);
	public void savePassword(UserEntity entity);
}
