package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.IIndustryDAO;
import com.searchmytraining.entity.IndustryEntity;
import com.searchmytraining.service.IIndustrySerivice;

@Service
public class IndustryService implements IIndustrySerivice {

	@Autowired
	private IIndustryDAO industrydao;
	
	
	@Override
	public List<IndustryEntity> getIndustries() {
		return industrydao.getIndustries();
	}


	@Override
	public IndustryEntity getIndustryById(int indId) {
		return industrydao.getIndustryById(indId);
	}

	
}
