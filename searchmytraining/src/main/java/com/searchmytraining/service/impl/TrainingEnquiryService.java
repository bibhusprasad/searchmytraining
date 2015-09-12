package com.searchmytraining.service.impl;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.TrainingEnquiryDao;
import com.searchmytraining.dto.TrainingEnquiryDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.TrainingEnquiryEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.ITrainingEnquiryService;

@Service
public class TrainingEnquiryService implements ITrainingEnquiryService {

	@Autowired
	public TrainingEnquiryDao trainingDao;
	@Autowired
	public DozerBeanMapper mapper;
	@Autowired
	public ICityService cityservice;
	
	@Transactional
	public void saveTrainingEnquiry(TrainingEnquiryDTO trainingenquirydto) {
		TrainingEnquiryEntity trainingenquiryentity = mapper.map(trainingenquirydto, TrainingEnquiryEntity.class);
		CityEntity cityentity = cityservice.getCity(trainingenquirydto.getCityid());
		trainingenquiryentity.setCity(cityentity);
		trainingDao.saveTrainingEnquiry(trainingenquiryentity);
	}

}
