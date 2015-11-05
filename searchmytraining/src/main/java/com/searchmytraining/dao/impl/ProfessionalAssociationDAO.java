package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IProfessionalAssociationDAO;
import com.searchmytraining.entity.ProfessionalAssociationEntity;

@Repository
public class ProfessionalAssociationDAO extends
		AbstractJpaDAO<ProfessionalAssociationEntity> implements
		IProfessionalAssociationDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	public void addAssociation(ProfessionalAssociationEntity entity) {
		if (entity.getAsscoId() != null) {
			update(entity);
		} else {
			create(entity);
		}
	}

	@Override
	public List<ProfessionalAssociationEntity> getProfAssocByUserId(Long userid) {
		String strquery = "from ProfessionalAssociationEntity prof where prof.user.userId=?";
		TypedQuery<ProfessionalAssociationEntity> typedquery = entitymanager
				.createQuery(strquery, ProfessionalAssociationEntity.class);
		typedquery.setParameter(1, userid.longValue());
		try {
			typedquery.setParameter(1, userid.longValue());
			List<ProfessionalAssociationEntity> associations = typedquery
					.getResultList();
			return associations;
		} catch (NoResultException e) {
		}
		return null;

	}
}
