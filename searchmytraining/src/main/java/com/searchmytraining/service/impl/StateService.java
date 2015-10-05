package com.searchmytraining.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.searchmytraining.dao.StateDAO;
import com.searchmytraining.entity.StateEntity;
import com.searchmytraining.service.IStateService;

@Service
public class StateService implements IStateService {

	@Autowired
	public StateDAO statedao;
	
	@Override
	public List<StateEntity> getStates(Integer countryid) {
		return statedao.getStates(countryid);
	}
	
	public List<StateEntity> getAllStates(){
		return statedao.getAllStates();
	}

	@Override
	public StateEntity getStateEntityById(Integer stateId) {
		return statedao.getState(stateId);
	}
	
	

}
