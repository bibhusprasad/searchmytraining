package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.SerachInstituteDAO;
import com.searchmytraining.entity.InstituteSearchEntity;

@Repository
public class SerachInstituteDAOImpl extends AbstractJpaDAO<InstituteSearchEntity> implements SerachInstituteDAO {

	@Override
	public List<InstituteSearchEntity> getAllInstitutes() {
		setClazz(InstituteSearchEntity.class);
		return findAll();
	}

	@Override
	public InstituteSearchEntity getInstitute(Long searchId) {
		setClazz(InstituteSearchEntity.class);
		return findOne(searchId);
	}

	@Override
	public List<InstituteSearchEntity> searchInstitues(String keyword,
			String city) {
		// TODO Auto-generated method stub
		return null;
	}

}
