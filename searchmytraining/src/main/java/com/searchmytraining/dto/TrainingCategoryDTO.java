package com.searchmytraining.dto;

public class TrainingCategoryDTO {
	
	private Integer exp;
	private Integer trainingcategory;
	public Integer getExp() {
		return exp;
	}
	public void setExp(Integer exp) {
		this.exp = exp;
	}
	public Integer getTrainingcategory() {
		return trainingcategory;
	}
	public void setTrainingcategory(Integer trainingcategory) {
		this.trainingcategory = trainingcategory;
	}
	@Override
	public String toString() {
		return "TrainingCategoryDTO [exp=" + exp + ", trainingcategory="
				+ trainingcategory + "]";
	}
}
