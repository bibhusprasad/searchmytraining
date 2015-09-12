package com.searchmytraining.dao;

import com.searchmytraining.security.UserAttempts;

public interface IUserAttemptsDAO {
	
	void updateFailAttempts(String userId);
	void resetFailAttempts(Long userId);
	UserAttempts getUserAttempts(String userId);

}
