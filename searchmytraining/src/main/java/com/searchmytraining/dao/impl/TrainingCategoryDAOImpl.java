package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.TrainingCategoryDAO;
import com.searchmytraining.entity.TrainingCategoryEntity;

@Repository
public class TrainingCategoryDAOImpl extends
		AbstractJpaDAO<TrainingCategoryEntity> implements TrainingCategoryDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public TrainingCategoryEntity addTrainingCategoryEntity(
			TrainingCategoryEntity trainingcategoryentity) {
		create(trainingcategoryentity);
		return trainingcategoryentity;
	}

	@Override
	public List<TrainingCategoryEntity> getAllTrainingCategories(Long userId) {
		String strqry = "from TrainingCategoryEntity trngcat where trngcat.user.userId=?";
		TypedQuery<TrainingCategoryEntity> typedqry = entityManager
				.createQuery(strqry, TrainingCategoryEntity.class);
		typedqry.setParameter(1, userId.longValue());
		try {
			typedqry.setParameter(1, userId.longValue());
			return typedqry.getResultList();
		} catch (NoResultException e) {
			return null;
		}
	}
}
