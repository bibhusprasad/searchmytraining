package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IEducationDAO;
import com.searchmytraining.entity.EducationEntity;

@Repository
public class EducationDAO extends AbstractJpaDAO<EducationEntity> implements
		IEducationDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void insertEducationDetails(EducationEntity educationentity) {
		create(educationentity);
	}

	@Override
	public void updateEducationDetails(EducationEntity educationentity) {
		update(educationentity);
	}

	@Override
	public EducationEntity getEducationDetails(Long userId) {
		String strqry = "from EducationEntity edu where edu.user.userId=?";
		TypedQuery<EducationEntity> typedqry = entityManager.createQuery(
				strqry, EducationEntity.class);
		typedqry.setParameter(1, userId.longValue());
		try {
			typedqry.setParameter(1, userId.longValue());
			return typedqry.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}

	}

}
