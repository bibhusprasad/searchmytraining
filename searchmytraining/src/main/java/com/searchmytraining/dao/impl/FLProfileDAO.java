package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IFLProfileDAO;
import com.searchmytraining.entity.FreeLancerProfileEntity;

@Repository
public class FLProfileDAO extends AbstractJpaDAO<FreeLancerProfileEntity> implements IFLProfileDAO{

	@Override
	public void insertFlProfDet(FreeLancerProfileEntity entity) {
		create(entity);
	}

	@Override
	public FreeLancerProfileEntity getFLProfileDet(Long userId) {
		
		EntityManager em = getEntityManager();
		String strqry = "from FreeLancerProfileEntity flprofdet where flprofdet.user.userId=?";
		TypedQuery<FreeLancerProfileEntity> typedqry = em.createQuery(strqry, FreeLancerProfileEntity.class);
		try
		{
			typedqry.setParameter(1, userId.intValue());
			FreeLancerProfileEntity entity = typedqry.getSingleResult();
			return entity;
		}
		catch(NoResultException e)
		{
			System.out.println("from getFLProfileDet: "+e.getMessage());
			return null;
		}
	}

	@Override
	public void updateFlProfDet(FreeLancerProfileEntity entity) {
		update(entity);
	}
}
