package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IIndustryDAO;
import com.searchmytraining.entity.IndustryEntity;

@Repository
public class IndustryDAO extends AbstractJpaDAO<IndustryEntity>implements IIndustryDAO {

	@Override
	@Cacheable(value="industryCache")
	public List<IndustryEntity> getIndustries() {
		setClazz(IndustryEntity.class);
		List<IndustryEntity> industries = (List<IndustryEntity>) findAll();
		return industries;
	}

}
