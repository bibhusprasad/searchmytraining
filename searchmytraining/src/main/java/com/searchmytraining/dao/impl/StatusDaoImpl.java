package com.searchmytraining.dao.impl;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.StatusDAO;
import com.searchmytraining.entity.StatusEntity;

@Repository
public class StatusDaoImpl extends AbstractJpaDAO<StatusEntity> implements StatusDAO {

	@Override
	public StatusEntity getStatus(Integer id) {
		setClazz(StatusEntity.class);
		return findOne(id);
	}

}
