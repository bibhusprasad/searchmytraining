package com.searchmytraining.dao;

import java.util.List;

import com.searchmytraining.entity.TrainingCategoryEntity;

public interface TrainingCategoryDAO {

	public TrainingCategoryEntity addTrainingCategoryEntity(TrainingCategoryEntity trainingcategoryentity);
	public List<TrainingCategoryEntity> getAllTrainingCategories(Long userId);
}
