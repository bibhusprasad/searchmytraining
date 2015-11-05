package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IFLProfileDAO;
import com.searchmytraining.entity.FreeLancerProfileEntity;

@Repository
public class FLProfileDAO extends AbstractJpaDAO<FreeLancerProfileEntity>
		implements IFLProfileDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void insertFlProfDet(FreeLancerProfileEntity entity) {
		create(entity);
	}

	@Override
	public FreeLancerProfileEntity getFLProfileDet(Long userId) {
		String strqry = "from FreeLancerProfileEntity flprofdet where flprofdet.user.userId=?";
		TypedQuery<FreeLancerProfileEntity> typedqry = entityManager
				.createQuery(strqry, FreeLancerProfileEntity.class);
		typedqry.setParameter(1, userId.longValue());
		try {
			typedqry.setParameter(1, userId.longValue());
			FreeLancerProfileEntity entity = typedqry.getSingleResult();
			return entity;
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void updateFlProfDet(FreeLancerProfileEntity entity) {
		update(entity);
	}
}
