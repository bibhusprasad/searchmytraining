package com.searchmytraining.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.entity.UserEntity;

@Repository
public class UserDaoImpl extends AbstractJpaDAO<UserEntity> implements UserDAO {

	EntityManager entityManager;
	
	@Override
	public void addUser(UserEntity entity) {
		try{
			create(entity);
			System.out.println("from addUser1: "+entity.getUserId());
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}

	@Override
	public Integer getMaxUserId(String idcolumn) {
		return getMaxId("UserEntity", idcolumn);
	}
	
	public UserEntity getUser(Integer id)
	{
		setClazz(UserEntity.class);
		UserEntity user = findOne(id);
		System.out.println("from UserDaoImpl: "+user.getUserName());
		return user;
	}

	@Override
	public UserEntity getUser(String username) {
		String query = "from UserEntity user where user.userName=?";
		entityManager = getEntityManager();
		TypedQuery<UserEntity> query1 = entityManager.createQuery(query,UserEntity.class);
		query1.setParameter(1, username.trim());
		UserEntity userentity = null;
		try
		{
			userentity = query1.getSingleResult();
		}
		catch(javax.persistence.NoResultException e)
		{
			System.out.println("Session Expired...No result found for userid(null)");
		}
		System.out.println(userentity.getUserId());
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
		entityManager = getEntityManager();
		TypedQuery<UserEntity> query1 = entityManager.createQuery(query,UserEntity.class);
		query1.setParameter(1, username.trim());
		UserEntity userentity = null;
		try
		{
			userentity = query1.getSingleResult();
			if(userentity.getUuid().equals(uuid))
			{
				userentity.setEmailVerified(1);
				update(userentity);
				System.out.println("Email Verified...");
				return true;
			}
		}
		catch(javax.persistence.NoResultException e)
		{
			System.out.println("Session Expired...No result found for userid(null): "+e.getMessage());
			return false;
		}
		catch(NullPointerException e)
		{
			System.out.println(e.getMessage());
			return false;
		}
		return false;
	}
	
	@Override
	public void savePassword(UserEntity userEntity) {
		Query query = getEntityManager().createQuery(
			      "UPDATE UserEntity  SET password = :password WHERE userId = :userId");
			  int updateCount = query.setParameter("password", userEntity.getPassword()).setParameter("userId", userEntity.getUserId()).executeUpdate();
			  System.out.println("Password updateCount"+ updateCount);
		
	}
}
