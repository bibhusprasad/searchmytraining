package com.searchmytraining.dao;

import com.searchmytraining.entity.InstituteEntity;

public interface InstituteDAO {
	
	public void updateInstituteDetails(InstituteEntity entity);
	public Integer getMaxUserId(String idcolumn);
	public InstituteEntity getInstituteInfo(Long userid);
}
