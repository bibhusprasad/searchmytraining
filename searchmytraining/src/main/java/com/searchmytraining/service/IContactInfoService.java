package com.searchmytraining.service;

import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.entity.ContactInfoEntity;

public interface IContactInfoService {

	public void updateContactInfoDet(ContactDTO contactdto);
	public ContactInfoEntity getContactInfoDetailsByUserId(Long userid);
}
