package com.searchmytraining.dao;

import com.searchmytraining.entity.ContactInfoEntity;

public interface IContactInfoDAO {
	
	public void insertContactInfo(ContactInfoEntity entity);
	public ContactInfoEntity getContactInfoDetails(Long userid);
	
}
