package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.ProfessionalAssociationEntity;

public interface IProfessionalAssociationDAO {
	
	public void addAssociation(ProfessionalAssociationEntity entity);
	public List<ProfessionalAssociationEntity> getProfAssocByUserId(Long userid);

}
