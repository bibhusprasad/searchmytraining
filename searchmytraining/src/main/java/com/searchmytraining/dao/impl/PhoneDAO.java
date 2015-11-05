package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.entity.PhoneEntity;

@Repository
public class PhoneDAO extends AbstractJpaDAO<PhoneEntity> implements IPhoneDAO {

	@PersistenceContext
	private EntityManager entityManger;

	@Override
	public void insertPhoneDetails(PhoneEntity entity) {
		create(entity);
	}

	@Override
	public List<PhoneEntity> getPhoneByUserId(Long userid) {
		String strquery = "from PhoneEntity phone where phone.user.userId=?";
		TypedQuery<PhoneEntity> typedQuery = entityManger.createQuery(strquery,
				PhoneEntity.class);
		typedQuery.setParameter(1, userid.longValue());
		try {
			typedQuery.setParameter(1, userid.longValue());
			List<PhoneEntity> phones = typedQuery.getResultList();
			return phones;
		} catch (NoResultException e) {
			return null;
		}
	}

	public PhoneEntity getPhoneDet(String phoneno) {
		String strquery = "from PhoneEntity phone where phone.phoneValue=?";
		TypedQuery<PhoneEntity> typedquery = entityManger.createQuery(strquery,
				PhoneEntity.class);
		typedquery.setParameter(1, phoneno);
		return typedquery.getSingleResult();
	}

	@Override
	public void updatePhoneDetails(PhoneEntity entity) {
		update(entity);
	}
}
