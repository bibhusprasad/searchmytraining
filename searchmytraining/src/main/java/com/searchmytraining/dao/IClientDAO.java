package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.ClientEntity;

public interface IClientDAO {
	public void addClientDetails(ClientEntity entity);
	public List<ClientEntity> getClientDetailsByUserId(Long userid);
}
