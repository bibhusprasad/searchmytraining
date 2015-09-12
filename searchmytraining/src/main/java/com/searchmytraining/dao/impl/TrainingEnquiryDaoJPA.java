package com.searchmytraining.dao.impl;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.TrainingEnquiryDao;
import com.searchmytraining.entity.TrainingEnquiryEntity;

@Repository
public class TrainingEnquiryDaoJPA extends AbstractJpaDAO<TrainingEnquiryEntity> implements TrainingEnquiryDao{

	@Override
	public void saveTrainingEnquiry(TrainingEnquiryEntity entity) {
		create(entity);
	}

}
