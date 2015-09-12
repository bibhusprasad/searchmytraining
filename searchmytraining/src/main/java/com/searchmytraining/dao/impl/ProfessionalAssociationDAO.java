package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IProfessionalAssociationDAO;
import com.searchmytraining.entity.ProfessionalAssociationEntity;

@Repository
public class ProfessionalAssociationDAO extends AbstractJpaDAO<ProfessionalAssociationEntity> implements IProfessionalAssociationDAO {

	@Override
	public void addAssociation(ProfessionalAssociationEntity entity) {
		if(entity.getAsscoId()!=null)
			update(entity);
		else
			create(entity);
	}
	@Override
	public List<ProfessionalAssociationEntity> getProfAssocByUserId(Long userid) {
		EntityManager entitymanager = getEntityManager();
		String strquery = "from ProfessionalAssociationEntity prof where prof.user.userId=?";
		TypedQuery<ProfessionalAssociationEntity> typedquery  = entitymanager.createQuery(strquery,ProfessionalAssociationEntity.class);
		System.out.println("userid from profassoc: "+userid);
		try{
			typedquery.setParameter(1, userid.intValue());
			List<ProfessionalAssociationEntity> associations = typedquery.getResultList();
			if(associations.size()!=0)
				return associations;
		}
		catch(NoResultException e)
		{
			System.out.println(e.getMessage()+"\nProfessional Association Info is not Available");
		}
		return null;
	}
}
