package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.CountryDAO;
import com.searchmytraining.entity.CountryEntity;

@Repository
public class CountryDaoImpl extends AbstractJpaDAO<CountryEntity> implements CountryDAO {

	@Override
	public CountryEntity getCountry(Long id) {
		return findOne(id);
	}

	@Override
	public CountryEntity getCountry(String countryname) {
			
		String query = "select country.countryId from CountryEntity country where country.countryName= '"+countryname+"'";
		Integer countryid =	(Integer)getQueryResult(query);
		System.out.println(countryid);
		setClazz(CountryEntity.class);
		return findOne(countryid);
	}

	@Override
	@Cacheable(value="countryCache")
	public List<CountryEntity> getAllCountries() {
		setClazz(CountryEntity.class);
		return findAll();
	}
	
	
}
