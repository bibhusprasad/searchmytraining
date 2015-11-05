package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IEmploymentDAO;
import com.searchmytraining.entity.EmploymentEntity;

@Repository
public class EmploymentDAO extends AbstractJpaDAO<EmploymentEntity> implements
		IEmploymentDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	public void updateEmpldet(EmploymentEntity emplEntity) {
		String query = "from EmploymentEntity empl where empl.user.userId=?";
		TypedQuery<EmploymentEntity> typedquery = entitymanager.createQuery(
				query, EmploymentEntity.class);
		try {
			typedquery.setParameter(1, emplEntity.getUser().getUserId());
			EmploymentEntity emplentity = typedquery.getSingleResult();
			emplEntity.setEmplmntId(emplentity.getEmplmntId());
			update(emplEntity);
		} catch (NoResultException e) {
			create(emplEntity);
		}
	}

	@Override
	public EmploymentEntity findEmplDet(Long userid) {
		String query = "from EmploymentEntity empl where empl.user.userId=?";
		TypedQuery<EmploymentEntity> typedquery = entitymanager.createQuery(
				query, EmploymentEntity.class);
		typedquery.setParameter(1, userid);
		try {
			typedquery.setParameter(1, userid);
			EmploymentEntity emplentity = typedquery.getSingleResult();
			return emplentity;
		} catch (NoResultException e) {
			return null;
		}
	}

}
