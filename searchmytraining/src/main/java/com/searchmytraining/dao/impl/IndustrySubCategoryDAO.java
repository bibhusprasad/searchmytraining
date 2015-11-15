package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IIndustrySubCategoryDAO;
import com.searchmytraining.entity.IndustrySubCategoryEntity;

@Repository
public class IndustrySubCategoryDAO extends
		AbstractJpaDAO<IndustrySubCategoryEntity> implements
		IIndustrySubCategoryDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Cacheable(value = "industrySubCatCache")
	public List<IndustrySubCategoryEntity> getIndustrySubCategories(
			Integer subid) {
		String query = "select indsubcategory from IndustrySubCategoryEntity indsubcategory where indsubcategory.industrycategory.trnIndstrCatId=?";
		TypedQuery<IndustrySubCategoryEntity> query1 = entityManager
				.createQuery(query, IndustrySubCategoryEntity.class);
		query1.setParameter(1, subid);
		return query1.getResultList();
	}

	@Override
	public IndustrySubCategoryEntity getIndustrySubCategory(
			Integer industrysubcatid) {
		setClazz(IndustrySubCategoryEntity.class);
		return findOne(industrysubcatid);
	}

	@Override
	public List<IndustrySubCategoryEntity> getAllIndustrySubCategories() {
		setClazz(IndustrySubCategoryEntity.class);
		return findAll();
	}
	
	@Override
	@Cacheable(value = "industrySubCatCache")
	public List<IndustrySubCategoryEntity> getIndustrySubCategory(
			List<Integer> subids) {
		String query = "select indsubcategory from IndustrySubCategoryEntity indsubcategory where indsubcategory.industrycategory.trnIndstrCatId in ?1";
		TypedQuery<IndustrySubCategoryEntity> query1 = entityManager
				.createQuery(query, IndustrySubCategoryEntity.class);
		query1.setParameter(1, subids);
		return query1.getResultList();
	}

}
