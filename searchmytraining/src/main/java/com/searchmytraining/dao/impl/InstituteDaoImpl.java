package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.InstituteDAO;
import com.searchmytraining.entity.InstituteEntity;

@Repository
public class InstituteDaoImpl extends AbstractJpaDAO<InstituteEntity> implements
		InstituteDAO {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public void updateInstituteDetails(InstituteEntity entity) {
		InstituteEntity institute = getInstituteInfo(entity.getUser()
				.getUserId().longValue());
		if (null != institute) {
			entity.setCompInfoId(institute.getCompInfoId());
			update(entity);
		} else{
			create(entity);
		}
	}

	@Override
	public Long getMaxUserId(String idcolumn) {
		return getMaxId("InstituteEntity", idcolumn);
	}

	@Override
	public InstituteEntity getInstituteInfo(Long userid) {
		String strquery = "from InstituteEntity inst where inst.user.userId=?";
		TypedQuery<InstituteEntity> typedquery = entityManager.createQuery(
				strquery, InstituteEntity.class);
			typedquery.setParameter(1, userid.longValue());
			InstituteEntity instituteEntity=null;
			try {
				instituteEntity= typedquery.getSingleResult();
			}catch(Exception e){
				
			}
			return instituteEntity;
	}
}
