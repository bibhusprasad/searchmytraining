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
import com.searchmytraining.service.ITrainingProviderService;

@Service
  public class TrainingProviderService implements ITrainingProviderService {
	
	@Autowired
	private WebApplicationContext context; 
	
	@Autowired
	private TrainerDAO regdao;
	@Autowired
	private DozerBeanMapper mapper;
	@Autowired
	private RoleDAO roledao;
	@Autowired
	private StatusDAO statusdao;
	@Autowired
	private UserDAO userdao;
	@Autowired
	private ICityService cityservice;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Autowired
	private InstituteDAO institutedao;
	@Autowired
	private IPhoneDAO phonedao;
	@Autowired
	private IContactInfoDAO contactdao;
	
	@Override
	@Transactional
	public Long registerTrainer(TrainerDTO trainerdto) {
		UserEntity userEntity = (UserEntity)context.getBean("userEntity");
		StatusEntity status = statusdao.getStatus(1);
		TrainerEntity entity = mapper.map(trainerdto, TrainerEntity.class);
		
		userEntity.setUserName(entity.getEmail());
		userEntity.setPassword(encoder.encode(entity.getPassword()));
		userEntity.setEnabled(Boolean.TRUE);
		userEntity.setAccountNonExpired(Boolean.TRUE);
		userEntity.setAccountNonLocked(Boolean.TRUE);
		userEntity.setCredentialsNonExpired(Boolean.TRUE);
		userEntity.setStatus(status);
		userdao.addUser(userEntity);
		
		InstituteEntity institute = (InstituteEntity)context.getBean("instituteEntity");
		institute.setCompanyName(entity.getOrg_name());
		institute.setUser(userEntity);
		
		ContactInfoEntity contact = (ContactInfoEntity)context.getBean("contactInfoEntity");
		contact.setEmailId(entity.getEmail());
		contact.setUser(userEntity);
		contactdao.insertContactInfo(contact);
		
		PhoneEntity phone = (PhoneEntity)context.getBean("phoneEntity");
		phone.setPhoneValue(entity.getContact());
		phone.setUser(userEntity);
		phonedao.insertPhoneDetails(phone);
		
		institutedao.updateInstituteDetails(institute);

		entity.setUser(userEntity);
		
		RoleEntity role = (RoleEntity)context.getBean("roleEntity");
		role.setROLE("TPI");
		role.setUser(userEntity);
		roledao.setRoleToUser(role);
		
		CityEntity city = (CityEntity)context.getBean("cityEntity");
		city = cityservice.getCity(trainerdto.getCity());
		entity.setCity(city);
		regdao.registerTrainer(entity);
		return userEntity.getUserId();
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
