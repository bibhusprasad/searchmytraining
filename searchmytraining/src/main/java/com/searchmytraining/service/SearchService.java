package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.entity.InstituteSearchEntity;

public interface SearchService {
	
	public List<InstituteSearchEntity> searchInstitues(String keyword,String city);
	public InstituteSearchEntity getInstitute(Long searchId);
	public List<InstituteSearchEntity> getAllInstitutes();

}
