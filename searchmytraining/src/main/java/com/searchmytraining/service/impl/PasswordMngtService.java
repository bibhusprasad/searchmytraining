package com.searchmytraining.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.IOTPDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.entity.OTPEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.IPasswordMgntService;
@Service
public class PasswordMngtService implements IPasswordMgntService{
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private IOTPDAO otpDao;
	
	@Override
	@Transactional
	public void saveOTP(long userId, int otp, Date timestamp) {
		
		otpDao.deleteOTP(userId);
		OTPEntity otpEntity = new OTPEntity();
		otpEntity.setOtp(otp);
		otpEntity.setTimestamp(timestamp);
		otpEntity.setUserId(userId);
		
		otpDao.saveOTP(otpEntity);
		
	}

	@Override
	public int getOTP(long userId) {
		OTPEntity otpEntity = otpDao.getOTP(userId);
		
		
		if(otpEntity != null){
			Date dbTime = otpEntity.getTimestamp();
			Date currentTime = new Date();
			long diff = currentTime.getTime() - dbTime.getTime();
			long diffMinutes = diff / 60000;
			if(diffMinutes < 10){			
				return otpEntity.getOtp();
			}else{
				return 0;
			}
		}else{
			return 0;
		}
	}

	@Override
	@Transactional
	public void savePassword(Long userId, String password) {
		UserEntity userEntity = new UserEntity();
		userEntity.setUserId(new Long(userId.longValue()));
		userEntity.setPassword(encoder.encode(password));
		userDao.savePassword(userEntity);
	}
	
	

}
