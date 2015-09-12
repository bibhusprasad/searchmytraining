package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.InstituteDAO;
import com.searchmytraining.entity.InstituteEntity;

@Repository
public class InstituteDaoImpl extends AbstractJpaDAO<InstituteEntity> implements InstituteDAO {

	@Override
	public void updateInstituteDetails(InstituteEntity entity) {
		InstituteEntity institute = getInstituteInfo(entity.getUser().getUserId().longValue());
		if(institute!=null)
		{
			entity.setCompInfoId(institute.getCompInfoId());
			update(entity);
		}
		else
			create(entity);
	}

	@Override
	public Integer getMaxUserId(String idcolumn) {
		return getMaxId("InstituteEntity", idcolumn);
	}

	@Override
	public InstituteEntity getInstituteInfo(Long userid) {
		EntityManager entityManager = getEntityManager();
		String strquery = "from InstituteEntity inst where inst.user.userId=?";
		TypedQuery<InstituteEntity> typedquery = entityManager.createQuery(strquery,InstituteEntity.class);
		try{
			typedquery.setParameter(1, userid.intValue());
			InstituteEntity institute = typedquery.getSingleResult();
			return institute;
		}
		catch(NoResultException e)
		{
			System.out.println("Exception caughted: "+e.getMessage());
			System.out.println("Institute Info is not available...");
			return null;
		}
	}
}
