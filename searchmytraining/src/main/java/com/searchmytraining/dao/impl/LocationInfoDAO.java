package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.ILocationInfoDAO;
import com.searchmytraining.entity.LocationEntity;

@Repository
public class LocationInfoDAO extends AbstractJpaDAO<LocationEntity> implements
		ILocationInfoDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	@Transactional
	public void insertLocation(LocationEntity locentity) {

		String query = "from LocationEntity location where location.user.userId=?";
		TypedQuery<LocationEntity> typedquery = entitymanager.createQuery(
				query, LocationEntity.class);
		typedquery.setParameter(1, locentity.getUser().getUserId());
		try {
			typedquery.setParameter(1, locentity.getUser().getUserId());
			LocationEntity locationentity = typedquery.getSingleResult();
			locentity.setLocDetialsId(locationentity.getLocDetialsId());
			update(locentity);
		} catch (NoResultException e) {
			create(locentity);
		}
	}

	@Override
	public LocationEntity findLocDet(Integer userid) {
		String query = "from LocationEntity empl where empl.user.userId=?";
		TypedQuery<LocationEntity> typedquery = entitymanager.createQuery(
				query, LocationEntity.class);
		typedquery.setParameter(1, userid);
		try {
			LocationEntity locEntity = typedquery.getSingleResult();
			return locEntity;
		} catch (NoResultException e) {
			return null;
		}
	}
}
