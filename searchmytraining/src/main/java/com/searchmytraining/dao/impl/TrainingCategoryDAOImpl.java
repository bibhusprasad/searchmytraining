package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.TrainingCategoryDAO;
import com.searchmytraining.entity.TrainingCategoryEntity;

@Repository
public class TrainingCategoryDAOImpl extends AbstractJpaDAO<TrainingCategoryEntity> implements TrainingCategoryDAO {

	
	@Override
	public TrainingCategoryEntity addTrainingCategoryEntity(TrainingCategoryEntity trainingcategoryentity) {
		create(trainingcategoryentity);
		return trainingcategoryentity;
	}

	@Override
	public List<TrainingCategoryEntity> getAllTrainingCategories(Long userId) {
		EntityManager em = getEntityManager();
		String strqry = "from TrainingCategoryEntity trngcat where trngcat.user.userId=?";
		TypedQuery<TrainingCategoryEntity> typedqry = em.createQuery(strqry, TrainingCategoryEntity.class);
		try
		{
			typedqry.setParameter(1, userId.intValue());
			return typedqry.getResultList();
		}
		catch(NoResultException e)
		{
			System.out.println("no result found for TrainingCategoryEntity...");
			return null;
		}
	}
}
