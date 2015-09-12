package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.CountryEntity;

public interface CountryDAO {
	
	public CountryEntity getCountry(Long id);	
	public CountryEntity getCountry(String countryname);
	public List<CountryEntity> getAllCountries();

}
