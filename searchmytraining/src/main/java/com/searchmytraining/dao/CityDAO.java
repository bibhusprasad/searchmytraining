package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.CityEntity;

public interface CityDAO {
	
	public CityEntity getCity(Integer id);
	public CityEntity getCity(String cityname);
	public List<CityEntity> getAllCities();
	public List<CityEntity> getCities(Integer stateid);

}
