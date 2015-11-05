package com.searchmytraining.service;

import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.entity.LocationEntity;

public interface ILocationService {
	public void updateLocationInfo(LocationDTO instlocdto);
	public LocationEntity findLocDet(Long long1);
}
