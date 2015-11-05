package com.searchmytraining.service;

import com.searchmytraining.dto.TrainerDTO;
import com.searchmytraining.entity.TrainerEntity;

public interface ITrainingProviderService {
		public Long registerTrainer(TrainerDTO trainerdto);
		public TrainerEntity getTrainer(Long id);
		public TrainerEntity getTrainerByUserid(Long userid);
}
