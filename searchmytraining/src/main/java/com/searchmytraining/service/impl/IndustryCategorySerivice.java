package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.IIndustryCategoryDAO;
import com.searchmytraining.entity.IndustryCategoryEntity;
import com.searchmytraining.service.IIndustryCategoryService;

@Service
public class IndustryCategorySerivice implements IIndustryCategoryService {

	@Autowired
	public IIndustryCategoryDAO industrycatdao;
	
	@Override
	public List<IndustryCategoryEntity> getIndustryCategories() {
		return industrycatdao.getIndustryCategories();
	}

	@Override
	public List<IndustryCategoryEntity> getIndustryCategories(Integer industryid) {
		return industrycatdao.getIndustryCategories(industryid);
	}

	@Override
	public List<IndustryCategoryEntity> getIndustryCategoriesbyid(
			Integer industrycatid) {
		return industrycatdao.getIndustryCategoriesbyid(industrycatid);
	}
}
