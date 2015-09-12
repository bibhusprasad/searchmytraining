package com.searchmytraining.service.impl;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.IEmploymentDAO;
import com.searchmytraining.dto.EmploymentDTO;
import com.searchmytraining.entity.EmploymentEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.IEmploymentService;
import com.searchmytraining.service.IIndustrySubCategoryService;
import com.searchmytraining.service.IUserService;

@Service
public class EmploymentService implements IEmploymentService {

	@Autowired
	public IEmploymentDAO empldao;
	
	@Autowired
	public DozerBeanMapper mapper;
	
	@Autowired
	public IUserService userservice;
	
	@Autowired IIndustrySubCategoryService indsubservcie;
	
	@Override
	@Transactional
	public void updateEmpldet(EmploymentDTO empldto) {
		EmploymentEntity emplEntity = mapper.map(empldto, EmploymentEntity.class);
		UserEntity user = userservice.getUser(empldto.getUserid());
		emplEntity.setUser(user);
		IndustrySubCategoryEntity indsubentity = indsubservcie.getIndustrySubCategory(empldto.getIndustrysubcatid());
		emplEntity.setIndsubcat(indsubentity);
		empldao.updateEmpldet(emplEntity);
	}

	@Override
	public EmploymentEntity findEmplDet(Integer userid) {
		return empldao.findEmplDet(userid);
	}
	
}
