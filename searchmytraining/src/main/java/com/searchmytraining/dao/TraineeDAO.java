package com.searchmytraining.dao;

import com.searchmytraining.entity.TraineeEntity;

public interface TraineeDAO {
	
	public void registerTrainee(TraineeEntity entity);
	public TraineeEntity getTrainee(Integer userid);

}
