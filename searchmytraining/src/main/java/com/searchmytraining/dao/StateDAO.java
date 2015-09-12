package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.StateEntity;

public interface StateDAO {
	
	public StateEntity getState(Integer id);
	public List<StateEntity> getStates(Long countryid);

}
