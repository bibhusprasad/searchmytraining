package com.searchmytraining.dao;

import com.searchmytraining.entity.LocationEntity;

public interface ILocationInfoDAO {
	
	public void insertLocation(LocationEntity entity);
	public LocationEntity findLocDet(Integer userid);

}
