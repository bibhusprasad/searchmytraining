package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.IndustrySubCategoryEntity;

public interface IIndustrySubCategoryDAO {
	
	public List<IndustrySubCategoryEntity> getIndustrySubCategories(Integer subid);
	public List<IndustrySubCategoryEntity> getAllIndustrySubCategories();
	public IndustrySubCategoryEntity getIndustrySubCategory(Integer industrysubcatid);
	public List<IndustrySubCategoryEntity> getIndustrySubCategory(List<Integer> subids);
}
