package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.entity.RoleEntity;

@Repository
public class RoleDaoImpl extends AbstractJpaDAO<RoleEntity> implements RoleDAO {

	@Override
	public void setRoleToUser(RoleEntity role) {
		create(role);
	}

	@Override
	public RoleEntity getRoleByUserId(Long userId) {
		
		EntityManager em = getEntityManager();
		String strqry = "from RoleEntity role where role.user.userId=?";
		TypedQuery<RoleEntity> typdqry = em.createQuery(strqry, RoleEntity.class);
		try
		{
			typdqry.setParameter(1, userId.intValue());
			return typdqry.getSingleResult();
		}
		catch(NoResultException e)
		{
			System.out.println("No role found");
			return null;
		}
	}
}
