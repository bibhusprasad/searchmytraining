package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.TrainerDAO;
import com.searchmytraining.entity.TrainerEntity;

@Repository
public class TrainerRegistrationDaoJPA extends AbstractJpaDAO<TrainerEntity>
		implements TrainerDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	public void registerTrainer(TrainerEntity entity) {
		create(entity);
	}

	public TrainerEntity getTrainer(Long id) {
		return findOne(id);
	}

	@Override
	public Long getMaxUserId(String idcolumn) {
		return getMaxId("TrainerEntity", idcolumn);
	}

	@Override
	public TrainerEntity getTrainerByUserid(Long userid) {
		String query = "from TrainerEntity trainer where trainer.user.userId=?";
		TypedQuery<TrainerEntity> typedquery = entitymanager.createQuery(query,
				TrainerEntity.class);
		typedquery.setParameter(1, userid.longValue());
		TrainerEntity trainer = typedquery.getSingleResult();
		return trainer;
	}
}
