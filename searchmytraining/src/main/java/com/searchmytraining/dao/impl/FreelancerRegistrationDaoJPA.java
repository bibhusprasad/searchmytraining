package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.FreelancerDAO;
import com.searchmytraining.entity.FreelancerEntity;

@Repository
public class FreelancerRegistrationDaoJPA extends
		AbstractJpaDAO<FreelancerEntity> implements FreelancerDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void registerFreelancer(FreelancerEntity entity) {
		create(entity);

	}

	@Override
	public FreelancerEntity getFreelancer(Long id) {
		return findOne(id);
	}

	@Override
	public Long getMaxUserId(String idcolumn) {
		return getMaxId("FreelancerEntity", idcolumn);
	}

	@Override
	public FreelancerEntity getFreeLancerDetByUserId(Long userid) {
		String strquery = "from FreelancerEntity flentity where flentity.user.userId=?";
		TypedQuery<FreelancerEntity> typedquery = entityManager.createQuery(
				strquery, FreelancerEntity.class);
		typedquery.setParameter(1, userid.longValue());
		try {
			typedquery.setParameter(1, userid.longValue());
			FreelancerEntity flentity = typedquery.getSingleResult();
			return flentity;
		} catch (NoResultException e) {
			return null;
		}
	}

}
