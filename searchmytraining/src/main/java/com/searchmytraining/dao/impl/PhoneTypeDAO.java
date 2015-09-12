package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IPhoneTypeDAO;
import com.searchmytraining.entity.PhoneTypeEntity;

@Repository
public class PhoneTypeDAO extends AbstractJpaDAO<PhoneTypeEntity> implements IPhoneTypeDAO {

	@Override
	public PhoneTypeEntity getPhoneType(Integer id) {
		setClazz(PhoneTypeEntity.class);
		return findOne(id);
	}

	@Override
	public List<PhoneTypeEntity> getAllPhoneTypes() {
		setClazz(PhoneTypeEntity.class);
		return findAll();
	}

}
