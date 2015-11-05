package com.searchmytraining.service;

import java.util.Map;

import com.searchmytraining.dto.TraineeDTO;
import com.searchmytraining.entity.TraineeEntity;

public interface ITraineeService {
	
	public Map<Long, Boolean> registerTrainee(TraineeDTO traineedto);
	
	public TraineeEntity getTrainee(Long long1);
}
