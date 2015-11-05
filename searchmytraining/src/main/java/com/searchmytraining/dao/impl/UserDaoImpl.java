package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.entity.UserEntity;

@Repository
public class UserDaoImpl extends AbstractJpaDAO<UserEntity> implements UserDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void addUser(UserEntity entity) {
		try{
			create(entity);
		}
		catch(Exception e)
		{
		}
	}

	@Override
	public Integer getMaxUserId(String idcolumn) {
		return getMaxId("UserEntity", idcolumn);
	}

	public UserEntity getUser(long id) {
		setClazz(UserEntity.class);
		UserEntity user = findOne(id);
		return user;
	}

	@Override
	public UserEntity getUser(String username) {
		String query = "from UserEntity user where user.userName=?";
		TypedQuery<UserEntity> tQuery = entityManager.createQuery(query,
				UserEntity.class);
		tQuery.setParameter(1, username.trim());
		UserEntity userentity = null;
		try {
			userentity = tQuery.getSingleResult();
		} catch (javax.persistence.NoResultException e) {
			
		}
		return userentity;
	}

	@Override
	public void updateUserUUID(String username, String uuid) {
		UserEntity user = getUser(username);
		user.setUuid(uuid);
		update(user);
	}

	@Override
	public boolean verifyEmail(String username, String uuid) {
		String query = "from UserEntity user where user.userName=?";
		TypedQuery<UserEntity> typedQuery = entityManager.createQuery(query,
				UserEntity.class);
		typedQuery.setParameter(1, username.trim());
		UserEntity userentity = null;
		boolean verifiedFlag = false;
		try {
			userentity = typedQuery.getSingleResult();
			if (null != userentity && userentity.getUuid().equals(uuid)) {
				userentity.setEmailVerified(Boolean.TRUE);
				update(userentity);
				verifiedFlag = true;
			}
		} catch (Exception e) {
		}
		return verifiedFlag;
	}

	@Override
	public void savePassword(UserEntity userEntity) {
		Query query = entityManager
				.createQuery(
						"UPDATE UserEntity  SET password = :password WHERE userId = :userId");
		query.setParameter("password", userEntity.getPassword())
				.setParameter("userId", userEntity.getUserId()).executeUpdate();
	}

}
