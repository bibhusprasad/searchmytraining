package com.searchmytraining.service;

import java.util.Date;

public interface IPasswordMgntService {
	
	public void saveOTP(long userId,int otp, Date timestamp );
	
	public int getOTP(long userId);

	public void savePassword(Long userId, String password);

}
