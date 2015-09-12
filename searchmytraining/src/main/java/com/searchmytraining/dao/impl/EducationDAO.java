package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IEducationDAO;
import com.searchmytraining.entity.EducationEntity;

@Repository
public class EducationDAO extends AbstractJpaDAO<EducationEntity> implements IEducationDAO {

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
		
		EntityManager em = getEntityManager();
		String strqry = "from EducationEntity edu where edu.user.userId=?";
		TypedQuery<EducationEntity> typedqry = em.createQuery(strqry, EducationEntity.class);
		try
		{
			typedqry.setParameter(1, userId.intValue());
			return typedqry.getSingleResult();
		}
		catch(NoResultException e)
		{
			System.out.println("from getEducationDetails: "+e.getMessage());
			return null;
		}
	}

}
