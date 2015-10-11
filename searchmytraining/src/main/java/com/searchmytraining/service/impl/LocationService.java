package com.searchmytraining.service.impl;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.CityDAO;
import com.searchmytraining.dao.ILocationInfoDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.dto.LocationDTO;
import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.LocationEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ILocationService;
@Service
public class LocationService implements ILocationService {

	@Autowired
	private ILocationInfoDAO locationdao;
	@Autowired
	private DozerBeanMapper mapper;
	@Autowired
	private UserDAO userdao;	
	@Autowired
	private CityDAO citydao;
	
	@Override
	@Transactional
	public void updateLocationInfo(LocationDTO locdto) {
		LocationEntity locentity = mapper.map(locdto, LocationEntity.class);
		UserEntity user = userdao.getUser(locdto.getUserid());
		CityEntity city = citydao.getCity(locdto.getCity());
		locentity.setUser(user);
		locentity.setCity(city);
		locationdao.insertLocation(locentity);
	}

	@Override
	public LocationEntity findLocDet(Integer userid) {
		return locationdao.findLocDet(userid);
	}
}
