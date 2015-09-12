package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.EducationDegreeEntity;

public interface IEducationDegreeDAO {
	
	public List<EducationDegreeEntity> getAllEducation();
	public EducationDegreeEntity getEducationDegree(Long edudegreeid);

}
