package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IEducationDegreeDAO;
import com.searchmytraining.entity.EducationDegreeEntity;

@Repository
public class EducationDegreeDAO extends AbstractJpaDAO<EducationDegreeEntity> implements IEducationDegreeDAO {

	@Override
	public List<EducationDegreeEntity> getAllEducation() {
		setClazz(EducationDegreeEntity.class);
		return findAll();
	}

	@Override
	public EducationDegreeEntity getEducationDegree(Long edudegreeid) {
		setClazz(EducationDegreeEntity.class);
		return findOne(edudegreeid);
	}
}
