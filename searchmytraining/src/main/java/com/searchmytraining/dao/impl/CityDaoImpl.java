package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.CityDAO;
import com.searchmytraining.entity.CityEntity;

@Repository
public class CityDaoImpl extends AbstractJpaDAO<CityEntity> implements CityDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public CityEntity getCity(Integer id) {
		setClazz(CityEntity.class);
		return findOne(id);
	}

	public CityEntity getCity(String cityname) {
		String query = "select city.cityId from CityEntity city where city.cityName= '"
				+ cityname.toUpperCase() + "'";
		Integer cityid = (Integer) getQueryResult(query);
		setClazz(CityEntity.class);
		return findOne(cityid);
	}

	@Override
	@Cacheable(value = "cityCache")
	public List<CityEntity> getAllCities() {
		setClazz(CityEntity.class);
		return findAll();
	}

	@Cacheable(value = "cityCache")
	public List<CityEntity> getCities(Long stateid) {
		setClazz(CityEntity.class);
		String query = "select cities from CityEntity cities where cities.state.stateId='"
				+ stateid + "'";
		TypedQuery<CityEntity> typedQuery = entityManager.createQuery(query,
				CityEntity.class);
		return typedQuery.getResultList();
	}

}
