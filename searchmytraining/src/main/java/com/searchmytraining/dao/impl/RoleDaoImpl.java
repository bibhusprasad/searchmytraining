package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.entity.RoleEntity;

@Repository
public class RoleDaoImpl extends AbstractJpaDAO<RoleEntity> implements RoleDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void setRoleToUser(RoleEntity role) {
		create(role);
	}

	@Override
	public RoleEntity getRoleByUserId(Long userId) {

		String strqry = "from RoleEntity role where role.user.userId=?";
		TypedQuery<RoleEntity> typdqry = entityManager.createQuery(strqry,
				RoleEntity.class);
		typdqry.setParameter(1, userId.intValue());
		try {
			typdqry.setParameter(1, userId.intValue());
			return typdqry.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
}
