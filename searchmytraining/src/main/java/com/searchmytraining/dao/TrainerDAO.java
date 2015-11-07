package com.searchmytraining.dao;

import com.searchmytraining.entity.TrainerEntity;

public interface TrainerDAO {
	
	public void registerTrainer(TrainerEntity entity);
	public TrainerEntity getTrainer(Long id);
	public Long getMaxUserId(String idcolumn);
	public TrainerEntity getTrainerByUserid(Long userid);
}
