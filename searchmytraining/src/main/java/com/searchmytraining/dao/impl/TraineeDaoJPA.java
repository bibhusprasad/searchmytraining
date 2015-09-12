package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.TraineeDAO;
import com.searchmytraining.entity.TraineeEntity;

@Repository
public class TraineeDaoJPA extends AbstractJpaDAO<TraineeEntity> implements TraineeDAO  {

	@Override
	public void registerTrainee(TraineeEntity entity) {
		create(entity);
	}

	@Override
	public TraineeEntity getTrainee(Integer userid) {
		String query = "from TraineeEntity trainee where trainee.user.userId=?";
		EntityManager entitymanager = getEntityManager();
		TypedQuery<TraineeEntity> typedquery = entitymanager.createQuery(query, TraineeEntity.class);
		typedquery.setParameter(1, userid);
		TraineeEntity trainee = typedquery.getSingleResult();
		return trainee;
	}

	
	
	
	

}
