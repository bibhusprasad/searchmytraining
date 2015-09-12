package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.IndustryCategoryEntity;

public interface IIndustryCategoryDAO {

	public List<IndustryCategoryEntity> getIndustryCategories();
	public List<IndustryCategoryEntity> getIndustryCategories(Integer industryid);
	public List<IndustryCategoryEntity> getIndustryCategoriesbyid(Integer industrycatid);
}
