package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.IndustryEntity;

public interface IIndustryDAO {

	public List<IndustryEntity> getIndustries();

	public IndustryEntity getIndustryById(int indId);
	
}
