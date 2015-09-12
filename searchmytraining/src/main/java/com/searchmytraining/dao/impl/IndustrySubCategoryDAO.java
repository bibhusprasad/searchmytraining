package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IIndustrySubCategoryDAO;
import com.searchmytraining.entity.IndustrySubCategoryEntity;

@Repository
public class IndustrySubCategoryDAO extends AbstractJpaDAO<IndustrySubCategoryEntity> implements IIndustrySubCategoryDAO {

	EntityManager entityManager;
	
	@Override
	@Cacheable(value="industrySubCatCache")
	public List<IndustrySubCategoryEntity> getIndustrySubCategories(Integer subid) 
	{
		System.out.println("from getIndustrySubCategories method");
		String query = "select indsubcategory from IndustrySubCategoryEntity indsubcategory where indsubcategory.industrycategory.trnIndstrCatId=?";
		entityManager = getEntityManager();
		TypedQuery<IndustrySubCategoryEntity> query1 = entityManager.createQuery(query, IndustrySubCategoryEntity.class);
		query1.setParameter(1, subid);
		List<IndustrySubCategoryEntity> list = query1.getResultList();
		return list;
	}

	@Override
	/*@Cacheable(value="industrySubCatCache")*/
	public IndustrySubCategoryEntity getIndustrySubCategory(
			Integer industrysubcatid) {
		System.out.println("from getIndustrySubCategory method");
		setClazz(IndustrySubCategoryEntity.class);
		return findOne(industrysubcatid);
	}

	@Override
	public List<IndustrySubCategoryEntity> getAllIndustrySubCategories() {
		setClazz(IndustrySubCategoryEntity.class);
		return findAll();
	}
	
	

}
