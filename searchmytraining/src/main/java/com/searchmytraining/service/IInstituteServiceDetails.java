package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.dto.ClientDetailsDTO;
import com.searchmytraining.dto.ContactDTO;
import com.searchmytraining.dto.InstituteDTO;
import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.dto.ProfessionalAssociationDTO;
import com.searchmytraining.dto.TrainingCategoryDTO;
import com.searchmytraining.entity.ClientEntity;
import com.searchmytraining.entity.InstituteEntity;
import com.searchmytraining.entity.ProfessionalAssociationEntity;
import com.searchmytraining.entity.TrainingCategoryEntity;

public interface IInstituteServiceDetails {
	
	public void updateInstituteDetails(InstituteDTO entity);
	public void updateInstituteContactInfo(ContactDTO instcontactdto);
	public void updateInstituteLocationInfo(LocationDTO instlocdto);
	public void updateProfessionalAssociations(ProfessionalAssociationDTO associationdto);
	public void updateClientDetails(ClientDetailsDTO clientdetailsdto);
	public InstituteEntity getInstituteInfo(Long userid);
	public List<ProfessionalAssociationEntity> getProfAssocByUserId(Long userid);
	public List<ClientEntity> getClientDetailsByUserId(Long userid);
	public void uploadInstituteLogo(InstituteEntity instituteentity);
	public TrainingCategoryEntity addTrainingCategoryEntity(TrainingCategoryDTO trainingcategorydto,Long userId);
	public List<TrainingCategoryEntity> getAllTrainingCategories(Long userId);
}
