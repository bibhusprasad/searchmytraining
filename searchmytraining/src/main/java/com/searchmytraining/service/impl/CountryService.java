package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.CountryDAO;
import com.searchmytraining.entity.CountryEntity;
import com.searchmytraining.service.ICountryService;

@Service
public class CountryService implements ICountryService {

	@Autowired
	public CountryDAO countrydao;
	
	@Override
	public CountryEntity getCountry(Long id) {
		return countrydao.getCountry(id);
	}

	@Override
	public CountryEntity getCountry(String countryname) {
		return countrydao.getCountry(countryname);
	}

	@Override
	public List<CountryEntity> getAllCountries() {
		return countrydao.getAllCountries();
	}

}
