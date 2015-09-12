package com.searchmytraining.service;

import com.searchmytraining.dto.TraineeDTO;
import com.searchmytraining.entity.TraineeEntity;

public interface ITraineeService {
	
	public Integer registerTrainee(TraineeDTO traineedto);
	public TraineeEntity getTrainee(Integer userid);
}
