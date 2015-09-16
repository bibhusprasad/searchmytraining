package com.searchmytraining.service.impl;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.IContactInfoDAO;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.dao.InstituteDAO;
import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.dao.StatusDAO;
import com.searchmytraining.dao.TrainerDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.dto.TrainerDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.ContactInfoEntity;
import com.searchmytraining.entity.InstituteEntity;
import com.searchmytraining.entity.PhoneEntity;
import com.searchmytraining.entity.RoleEntity;
import com.searchmytraining.entity.StatusEntity;
import com.searchmytraining.entity.TrainerEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.IInstituteServiceDetails;
import com.searchmytraining.service.ITrainingProviderService;

@Service
  public class TrainingProviderService implements ITrainingProviderService {
	
	@Autowired
	public WebApplicationContext context; 
	
	@Autowired
	public TrainerDAO regdao;
	@Autowired
	public DozerBeanMapper mapper;
	@Autowired
	public RoleDAO roledao;
	@Autowired
	public StatusDAO statusdao;
	@Autowired
	public UserDAO userdao;
	@Autowired
	public ICityService cityservice;
	@Autowired
	public BCryptPasswordEncoder encoder;
	@Autowired
	public InstituteDAO institutedao;
	@Autowired
	public IPhoneDAO phonedao;
	@Autowired
	public IContactInfoDAO contactdao;
	
	@Override
	@Transactional
	public Integer registerTrainer(TrainerDTO trainerdto) {
		UserEntity user = (UserEntity)context.getBean("userEntity");
		StatusEntity status = statusdao.getStatus(1);
		TrainerEntity entity = mapper.map(trainerdto, TrainerEntity.class);
		
		user.setUserName(entity.getEmail());
		user.setPassword(encoder.encode(entity.getPassword()));
		user.setEnabled(Boolean.TRUE);
		user.setAccountNonExpired(Boolean.TRUE);
		user.setAccountNonLocked(Boolean.TRUE);
		user.setCredentialsNonExpired(Boolean.TRUE);
		user.setStatus(status);
		userdao.addUser(user);
		
		InstituteEntity institute = (InstituteEntity)context.getBean("instituteEntity");
		institute.setCompanyName(entity.getOrg_name());
		institute.setUser(user);
		
		ContactInfoEntity contact = (ContactInfoEntity)context.getBean("contactInfoEntity");
		contact.setEmailId(entity.getEmail());
		contact.setUser(user);
		contactdao.insertContactInfo(contact);
		
		PhoneEntity phone = (PhoneEntity)context.getBean("phoneEntity");
		phone.setPhoneValue(entity.getContact());
		phone.setUser(user);
		phonedao.insertPhoneDetails(phone);
		
		institutedao.updateInstituteDetails(institute);

		entity.setUser(user);
		
		RoleEntity role = (RoleEntity)context.getBean("roleEntity");
		role.setROLE("TPI");
		role.setUser(user);
		roledao.setRoleToUser(role);
		
		CityEntity city = (CityEntity)context.getBean("cityEntity");
		city = cityservice.getCity(trainerdto.getCity());
		entity.setCity(city);
		regdao.registerTrainer(entity);
		return user.getUserId();
	}
	@Override
	public TrainerEntity getTrainer(Long id) {
		return regdao.getTrainer(id);
	}
	@Override
	public TrainerEntity getTrainerByUserid(Long userid) {
		return regdao.getTrainerByUserid(userid);
	}
}
