package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.SerachInstituteDAO;
import com.searchmytraining.entity.InstituteSearchEntity;
import com.searchmytraining.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	public SerachInstituteDAO searchdao;
	
	@Override
	public List<InstituteSearchEntity> searchInstitues(String keyword, String city) {
		
		return null;
	}

	@Override
	public InstituteSearchEntity getInstitute(Long searchId) {
		return searchdao.getInstitute(searchId);
	}

	@Override
	public List<InstituteSearchEntity> getAllInstitutes() {
		return searchdao.getAllInstitutes();
	}

}
