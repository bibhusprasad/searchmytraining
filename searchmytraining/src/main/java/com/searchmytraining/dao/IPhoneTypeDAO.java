package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.PhoneTypeEntity;

public interface IPhoneTypeDAO {
	
	public PhoneTypeEntity getPhoneType(Integer id);
	public List<PhoneTypeEntity> getAllPhoneTypes(); 

}
