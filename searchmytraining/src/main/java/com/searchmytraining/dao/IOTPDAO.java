package com.searchmytraining.dao;

import com.searchmytraining.entity.OTPEntity;

public interface IOTPDAO {

		public OTPEntity getOTP(long userId);
		public void saveOTP(OTPEntity otpEntity);
		public void deleteOTP(long entityId);
		
}