package com.searchmytraining.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.IClientDAO;
import com.searchmytraining.entity.ClientEntity;

@Repository
public class ClientDAO extends AbstractJpaDAO<ClientEntity> implements
		IClientDAO {

	@PersistenceContext
	private EntityManager entitymanager;

	@Override
	public void addClientDetails(ClientEntity entity) {
		if (entity.getKeyClientId() != null) {
			update(entity);
		} else {
			create(entity);
		}
	}

	@Override
	public List<ClientEntity> getClientDetailsByUserId(Long userid) {
		String strquery = "from ClientEntity client where client.user.userId=?";
		TypedQuery<ClientEntity> typedquery = entitymanager.createQuery(
				strquery, ClientEntity.class);
		typedquery.setParameter(1, userid.intValue());
		try {
			typedquery.setParameter(1, userid.intValue());
			List<ClientEntity> clientlist = typedquery.getResultList();
			if (clientlist.size() != 0)
				return clientlist;
		} catch (NoResultException e) {
		}
		return null;
	}
}
