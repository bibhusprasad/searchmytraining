package com.searchmytraining.service;

import java.util.List;

import com.searchmytraining.entity.StateEntity;

public interface IStateService {
	
	public List<StateEntity> getStates(Long countryid);
	public List<StateEntity> getAllStates();
	public StateEntity getStateEntityById(int stateId);

}
