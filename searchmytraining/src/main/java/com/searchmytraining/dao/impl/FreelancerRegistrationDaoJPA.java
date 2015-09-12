package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.FreelancerDAO;
import com.searchmytraining.entity.FreelancerEntity;

@Repository
public class FreelancerRegistrationDaoJPA extends AbstractJpaDAO<FreelancerEntity> implements FreelancerDAO 
{

	@Override
	public void registerFreelancer(FreelancerEntity entity) {
		create(entity);		
		
	}

	@Override
	public FreelancerEntity getFreelancer(Long id) {
		return findOne(id);
	}

	@Override
	public Integer getMaxUserId(String idcolumn) {
		return getMaxId("FreelancerEntity", idcolumn);
	}

	@Override
	public FreelancerEntity getFreeLancerDetByUserId(Long userid) {
		EntityManager em = getEntityManager();
		String strquery = "from FreelancerEntity flentity where flentity.user.userId=?";
		TypedQuery<FreelancerEntity> typedquery = em.createQuery(strquery,FreelancerEntity.class);
		try
		{
			typedquery.setParameter(1, userid.intValue());
			FreelancerEntity flentity = typedquery.getSingleResult();
			return flentity;
		}
		catch(NoResultException e)
		{
			System.out.println("Freelancer Entity is not available, use is NEW...");
			return null;
		}
	}

}
