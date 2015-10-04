package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.entity.IndustryEntity;

public interface IIndustrySerivice {
	
	public List<IndustryEntity> getIndustries();

	public IndustryEntity getIndustryById(int indId);
}
