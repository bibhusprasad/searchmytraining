package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.StateDAO;
import com.searchmytraining.entity.StateEntity;

@Repository
public class StateDaoImpl extends AbstractJpaDAO<StateEntity> implements
		StateDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public StateEntity getState(Integer id) {
		setClazz(StateEntity.class);
		return findOne(id);
	}

	@Override
	@Cacheable(value = "stateCache")
	public List<StateEntity> getStates(Long countryid) {
		setClazz(StateEntity.class);
		String query = "select states from StateEntity states where states.country.countryId='"
				+ countryid + "'";
		TypedQuery<StateEntity> query1 = entityManager.createQuery(query,
				StateEntity.class);
		return query1.getResultList();
	}

	@Override
	@Cacheable(value="stateCache")
	public List<StateEntity> getAllStates() {
		setClazz(StateEntity.class);
		return findAll();
	}
}
