package com.searchmytraining.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.searchmytraining.dao.CityDAO;
import com.searchmytraining.dao.IClientDAO;
import com.searchmytraining.dao.IContactInfoDAO;
import com.searchmytraining.dao.IIndustrySubCategoryDAO;
import com.searchmytraining.dao.ILocationInfoDAO;
import com.searchmytraining.dao.IPhoneDAO;
import com.searchmytraining.dao.IPhoneTypeDAO;
import com.searchmytraining.dao.IProfessionalAssociationDAO;
import com.searchmytraining.dao.InstituteDAO;
import com.searchmytraining.dao.TrainingCategoryDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.dto.ClientDetailsDTO;
import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.dto.InstituteDTO;
import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.dto.ProfessionalAssociationDTO;
import com.searchmytraining.dto.TrainingCategoryDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.ClientEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.InstituteEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.ProfessionalAssociationEntity;
import com.searchmytraining.entity.TrainingCategoryEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.IInstituteServiceDetails;

@Service
public class InstituteServiceDetails implements IInstituteServiceDetails {

	@Autowired
	public WebApplicationContext context;
	@Autowired
	public InstituteDAO institutedao;
	@Autowired
	public IContactInfoDAO contactinfodao;
	@Autowired
	public UserDAO userdao;
	@Autowired
	public DozerBeanMapper mapper;
	@Autowired
	public IPhoneTypeDAO phonetypedao;
	@Autowired
	public IPhoneDAO phonedao;
	@Autowired
	public CityDAO citydao;
	@Autowired
	public ILocationInfoDAO locationdao;
	@Autowired
	public IProfessionalAssociationDAO assocdao;
	@Autowired
	public IClientDAO clientdao;
	@Autowired
	public TrainingCategoryDAO trngcatdao;
	@Autowired
	public IIndustrySubCategoryDAO subcatdao;
	
	
	@Override
	@Transactional
	public void updateInstituteDetails(InstituteDTO institudedto) {
		
		String workingdays = institudedto.getWorkingDays().toString().replace("[", "").replace("]", "");
		InstituteEntity entity = mapper.map(institudedto, InstituteEntity.class);
		entity.setWorkingDays(workingdays);
		UserEntity user = userdao.getUser(institudedto.getUserid());
		entity.setUser(user);
		institutedao.updateInstituteDetails(entity);
	}

	@Override
	@Transactional
	public void updateInstituteContactInfo(ContactDTO instcontactdto) {

		/*ContactInfoEntity contactinfoentity = mapper.map(instcontactdto, ContactInfoEntity.class);
		UserEntity user = userdao.getUser(instcontactdto.getUserid());
		contactinfoentity.setUser(user);
		
		// insertion of ContactInfo details
		contactinfodao.insertContactInfo(contactinfoentity);
		
		//Getting PhoneType
		PhoneTypeEntity phonetypeentity = phonetypedao.getPhoneType(instcontactdto.getPhonetypeid());
		
		PhoneEntity phoneentity = new PhoneEntity();
		phoneentity.setPhonetype(phonetypeentity);
		phoneentity.setPhoneValue(instcontactdto.getPhone());
		phoneentity.setUser(user);
		
		// insertion of Phone Details
		phonedao.insertPhoneDetails(phoneentity);*/
	}

	@Override
	@Transactional
	public void updateInstituteLocationInfo(LocationDTO instlocdto) {
		
		LocationEntity locentity = mapper.map(instlocdto, LocationEntity.class);
		UserEntity user = userdao.getUser(instlocdto.getUserid());
		CityEntity city = citydao.getCity(instlocdto.getCity());
		locentity.setUser(user);
		locentity.setCity(city);
		locationdao.insertLocation(locentity);
	}

	@Override
	@Transactional
	public void updateProfessionalAssociations(ProfessionalAssociationDTO associationdto) {
		UserEntity user = userdao.getUser(associationdto.getUserid()); // Getting required User
		ArrayList<String> associationNames = associationdto.getAssocName();
		ArrayList<Integer> assocIds = associationdto.getAssocIds();
		System.out.println("assocIds size: "+assocIds.size());
		Iterator<Integer> i = assocIds.iterator();
		for(String assocName:associationNames)
		{
			ProfessionalAssociationEntity profentity_new = (ProfessionalAssociationEntity)context.getBean("professionalAssociationEntity");
			profentity_new.setUser(user);
			if(i.hasNext())
			{
				profentity_new.setAsscoId(i.next());
				profentity_new.setAssocName(assocName);
			}
			else
				profentity_new.setAssocName(assocName);
			assocdao.addAssociation(profentity_new);  // insertion of Professional Association
		}
	}

	@Override
	@Transactional
	public void updateClientDetails(ClientDetailsDTO clientdetailsdto) {

		UserEntity user = userdao.getUser(clientdetailsdto.getUserid());
		System.out.println("client id size: "+clientdetailsdto.getClientIds().size());
		List<String> clientNames = clientdetailsdto.getClientName();
		List<Integer> clientids = clientdetailsdto.getClientIds();
		Iterator<Integer> i = clientids.iterator();
		for(String clientname:clientNames)
		{
			ClientEntity cliententity = (ClientEntity)context.getBean("clientEntity");
			cliententity.setUser(user);
			if(i.hasNext())
				cliententity.setKeyClientId(i.next());
			cliententity.setClientName(clientname);
			clientdao.addClientDetails(cliententity); // Insertion of Client Details
		}
		
	}
	@Override
	public InstituteEntity getInstituteInfo(Long userid) {
		return institutedao.getInstituteInfo(userid);
	}

	@Override
	public List<ProfessionalAssociationEntity> getProfAssocByUserId(Long userid) {
		return assocdao.getProfAssocByUserId(userid);
	}

	@Override
	public List<ClientEntity> getClientDetailsByUserId(Long userid) {
		return clientdao.getClientDetailsByUserId(userid);
	}

	@Override
	@Transactional
	public void uploadInstituteLogo(InstituteEntity instituteentity) {
		institutedao.updateInstituteDetails(instituteentity);
	}

	@Override
	@Transactional
	public TrainingCategoryEntity addTrainingCategoryEntity(TrainingCategoryDTO trainingcategorydto,Long userId){
		TrainingCategoryEntity trainingcategoryentity = mapper.map(trainingcategorydto, TrainingCategoryEntity.class);
		UserEntity user = userdao.getUser(userId.intValue());
		IndustrySubCategoryEntity subcatentity = subcatdao.getIndustrySubCategory(trainingcategorydto.getTrainingcategory());
		trainingcategoryentity.setUser(user);
		trainingcategoryentity.setSubcatentity(subcatentity);
		trainingcategoryentity = trngcatdao.addTrainingCategoryEntity(trainingcategoryentity);
		return trainingcategoryentity;
	}

	@Override
	public List<TrainingCategoryEntity> getAllTrainingCategories(Long userId) {
		return trngcatdao.getAllTrainingCategories(userId);
	}

}
