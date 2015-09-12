package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.entity.IndustryCategoryEntity;

public interface IIndustryCategoryService {
	
	public List<IndustryCategoryEntity> getIndustryCategories();
	public List<IndustryCategoryEntity> getIndustryCategories(Integer industryid);
	public List<IndustryCategoryEntity> getIndustryCategoriesbyid(Integer industrycatid);
}
