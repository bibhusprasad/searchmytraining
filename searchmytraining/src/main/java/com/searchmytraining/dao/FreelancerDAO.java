package com.searchmytraining.dao;

import com.searchmytraining.entity.FreelancerEntity;

public interface FreelancerDAO 
{
	public void registerFreelancer(FreelancerEntity entity);
	public FreelancerEntity getFreelancer(Long id);
	public Integer getMaxUserId(String idcolumn);
	public FreelancerEntity getFreeLancerDetByUserId(Long userid);
}
