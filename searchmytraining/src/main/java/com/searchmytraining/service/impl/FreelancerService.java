package com.searchmytraining.service.impl;

import java.util.List;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.FreelancerDAO;
import com.searchmytraining.dao.IEducationDAO;
import com.searchmytraining.dao.IEducationDegreeDAO;
import com.searchmytraining.dao.IFLProfileDAO;
import com.searchmytraining.dao.IFreeeLCertificationAwrdDAO;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.dao.IPhoneTypeDAO;
import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.dao.StatusDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.dto.CertificationAwardDTO;
import com.searchmytraining.dto.EducationDTO;
import com.searchmytraining.dto.FreelancerDTO;
import com.searchmytraining.entity.CertificationAwardEntity;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.EducationDegreeEntity;
import com.searchmytraining.entity.EducationEntity;
import com.searchmytraining.entity.FreeLancerProfileEntity;
import com.searchmytraining.entity.FreelancerEntity;
import com.searchmytraining.entity.PhoneEntity;
import com.searchmytraining.entity.PhoneTypeEntity;
import com.searchmytraining.entity.RoleEntity;
import com.searchmytraining.entity.StatusEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.IFreelancerService;

@Service
public class FreelancerService implements IFreelancerService
{
	@Autowired
	private WebApplicationContext context;
	@Autowired
	private FreelancerDAO freelancerdao;
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
	private IFreeeLCertificationAwrdDAO certidao;
	@Autowired
	private IFLProfileDAO flprofiledao;
	@Autowired
	private IPhoneDAO phonedao;
	@Autowired
	private IPhoneTypeDAO phonetypedao;
	@Autowired
	private IEducationDegreeDAO edudegreedao;
	@Autowired
	private IEducationDAO edudao;
	
	@Override
	@Transactional
	public Integer registerFreelancer(FreelancerDTO freelancerDto) {
		StatusEntity status = statusdao.getStatus(1);
		FreelancerEntity entity = mapper.map(freelancerDto, FreelancerEntity.class);
		UserEntity user = (UserEntity)context.getBean("userEntity");
		user.setUserName(entity.getEmail());
		user.setPassword(encoder.encode(freelancerDto.getPassword12()));
		user.setEnabled(Boolean.TRUE);
		user.setAccountNonExpired(Boolean.TRUE);
		user.setAccountNonLocked(Boolean.TRUE);
		user.setCredentialsNonExpired(Boolean.TRUE);
		user.setStatus(status);
		// Insertion of user in users table
		userdao.addUser(user);
		//Insertion of Role in user_roles table
		RoleEntity role = (RoleEntity)context.getBean("roleEntity");
		role.setROLE("TPF");
		role.setUser(user);
		roledao.setRoleToUser(role);
		entity.setUser(user);
		
		CityEntity city = (CityEntity)context.getBean("cityEntity");
		city = cityservice.getCity(freelancerDto.getCity12());
		entity.setCity(city);
		
		FreeLancerProfileEntity flProfEntity = mapper.map(freelancerDto, FreeLancerProfileEntity.class);
		flProfEntity.setUser(user);
		flprofiledao.insertFlProfDet(flProfEntity);
		
		
		PhoneEntity phone = (PhoneEntity)context.getBean("phoneEntity");
		PhoneTypeEntity phonetype = phonetypedao.getPhoneType(3);
		phone.setPhonetype(phonetype);
		phone.setPhoneValue(freelancerDto.getContact12());
		phone.setUser(user);
		
		phonedao.insertPhoneDetails(phone);
		/*freelancerdao.registerFreelancer(entity);*/
		return userdao.getMaxUserId("userId");
	}

	@Override
	public FreelancerEntity getFreeLancerDetByUserId(Long userid) {
		return freelancerdao.getFreeLancerDetByUserId(userid);
	}

	@Override
	public CertificationAwardEntity getCertificationDetByUserId(Long userid) {
		return certidao.getCertificationDetByUserId(userid);
	}

	@Override
	@Transactional
	public void insertFlProfDet(FreeLancerProfileEntity entity) {
		flprofiledao.insertFlProfDet(entity);
	}
	
	public FreeLancerProfileEntity getFLProfileDet(Long userId)
	{
		return flprofiledao.getFLProfileDet(userId);
	}

	@Override
	@Transactional
	public void updateFlProfDet(FreeLancerProfileEntity entity) {
		flprofiledao.updateFlProfDet(entity);
	}

	@Override
	public List<PhoneEntity> getFLPhoneDetails(Long userId) {
		return phonedao.getPhoneByUserId(userId);
	}
	
	public List<EducationDegreeEntity> getAllEduDetails()
	{
		return edudegreedao.getAllEducation();
	}
	
	@Override
	@Transactional
	public void updateEduDetails(EducationDTO educationdto, Integer userId)
	{
		EducationEntity educationentity_new = mapper.map(educationdto, EducationEntity.class);
		
		EducationDegreeEntity edudegree = edudegreedao.getEducationDegree(educationdto.getDegreeid());
		if(!edudegree.getDegree().equalsIgnoreCase("other"))
			educationentity_new.setDegreeOther(null);
		educationentity_new.setDegree(edudegreedao.getEducationDegree(educationdto.getDegreeid()));
		educationentity_new.setUser(userdao.getUser(userId));
		EducationEntity educationentity_curr = getEducationDetails(userId.longValue());
		if(educationentity_curr!=null)
		{
			educationentity_new.setEduDetId(educationentity_curr.getEduDetId());
			edudao.updateEducationDetails(educationentity_new);
		}
		else
		{
			edudao.insertEducationDetails(educationentity_new);
		}
	}
	
	public EducationEntity getEducationDetails(Long userId)
	{
		return edudao.getEducationDetails(userId);
	}
	
	@Override
	@Transactional
	public void updateCertiAndAwardInfo(CertificationAwardDTO certidto) {
		CertificationAwardEntity certientity_new = mapper.map(certidto, CertificationAwardEntity.class);
		CertificationAwardEntity certientity_curr = certidao.getCertificationDetByUserId(certidto.getUserid().longValue());
		if(certientity_curr!=null)
		{
			certientity_new.setCertfctId(certientity_curr.getCertfctId());
			certientity_new.setUser(certientity_curr.getUser());
			certidao.updateCertificationAwrdDet(certientity_new);
		}
		else
		{
			certientity_new.setUser(userdao.getUser(certidto.getUserid()));
			certidao.insertCertificationAwrdDet(certientity_new);
		}
	}
}
