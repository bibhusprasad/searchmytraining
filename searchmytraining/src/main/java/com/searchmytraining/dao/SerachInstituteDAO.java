package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.InstituteSearchEntity;

public interface SerachInstituteDAO {
	
	public List<InstituteSearchEntity> searchInstitues(String keyword,String city);
	public InstituteSearchEntity getInstitute(Long searchId);
	public List<InstituteSearchEntity> getAllInstitutes();

}
