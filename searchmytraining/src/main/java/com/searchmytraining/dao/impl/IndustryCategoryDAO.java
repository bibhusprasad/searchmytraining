package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IIndustryCategoryDAO;
import com.searchmytraining.entity.IndustryCategoryEntity;

@Repository
public class IndustryCategoryDAO extends AbstractJpaDAO<IndustryCategoryEntity>
		implements IIndustryCategoryDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Cacheable(value = "industryCatCache")
	public List<IndustryCategoryEntity> getIndustryCategories() {
		setClazz(IndustryCategoryEntity.class);
		return findAll();
	}

	@Cacheable(value = "industryCatCache")
	public List<IndustryCategoryEntity> getIndustryCategories(Integer industryid) {
		String query = "select industryCat from IndustryCategoryEntity industryCat where industryCat.industry.trnIndstrId= '"
				+ industryid + "'";
		TypedQuery<IndustryCategoryEntity> typedQuery = entityManager
				.createQuery(query, IndustryCategoryEntity.class);
		List<IndustryCategoryEntity> categoryEntities = typedQuery.getResultList();
		return categoryEntities;
	}

	@Override
	public List<IndustryCategoryEntity> getIndustryCategoriesbyid(
			Integer industrycatid) {
		return null;
	}
}
