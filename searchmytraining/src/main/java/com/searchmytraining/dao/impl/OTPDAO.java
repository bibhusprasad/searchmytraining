package com.searchmytraining.dao.impl;

import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IOTPDAO;
import com.searchmytraining.entity.OTPEntity;

@Repository
public class OTPDAO extends AbstractJpaDAO<OTPEntity> implements IOTPDAO {

	
	
	@Override
	public OTPEntity getOTP(long userId) {
		
		TypedQuery<OTPEntity> typedQuery  = getEntityManager().createQuery(
			      "FROM OTPEntity otp WHERE otp.userId = :userId",OTPEntity.class);
		typedQuery.setParameter("userId", userId);
		
		return typedQuery.getSingleResult();
	}
	@Override
	public void saveOTP(OTPEntity otpEntity) {
		create(otpEntity);
		
	}
	@Override
	public void deleteOTP(long userId) {
		
		 Query query = getEntityManager().createQuery(
			      "DELETE FROM OTPEntity otp WHERE otp.userId = :userId");
			  int deletedCount = query.setParameter("userId", userId).executeUpdate();
		System.out.println(deletedCount);
		
	}
	
	
	
	
	
	
	

}
