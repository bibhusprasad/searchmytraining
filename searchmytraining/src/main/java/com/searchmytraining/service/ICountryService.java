package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.entity.CountryEntity;

public interface ICountryService {
	
	public CountryEntity getCountry(Long id);	
	public CountryEntity getCountry(String countryname);
	public List<CountryEntity> getAllCountries();

}
