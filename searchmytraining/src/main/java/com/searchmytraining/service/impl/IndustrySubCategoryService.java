package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.IIndustrySubCategoryDAO;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.service.IIndustrySubCategoryService;

@Service
public class IndustrySubCategoryService implements IIndustrySubCategoryService {

	@Autowired
	public IIndustrySubCategoryDAO subcatdao;
	
	@Override
	public List<IndustrySubCategoryEntity> getIndustrySubCategories(Integer subid) {
		return subcatdao.getIndustrySubCategories(subid);
	}

	@Override
	public IndustrySubCategoryEntity getIndustrySubCategory(Integer industrysubcatid) {
		return subcatdao.getIndustrySubCategory(industrysubcatid);
	}

	@Override
	public List<IndustrySubCategoryEntity> getAllIndustrySubCategories() {
		return subcatdao.getAllIndustrySubCategories();
	}

}
