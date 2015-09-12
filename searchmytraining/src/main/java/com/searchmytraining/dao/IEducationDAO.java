package com.searchmytraining.dao;

import com.searchmytraining.entity.EducationEntity;

public interface IEducationDAO {
	
	public void insertEducationDetails(EducationEntity educationentity);
	public void updateEducationDetails(EducationEntity educationentity);
	public EducationEntity getEducationDetails(Long userId);
}
