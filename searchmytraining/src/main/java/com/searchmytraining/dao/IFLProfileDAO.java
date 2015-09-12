package com.searchmytraining.dao;

import com.searchmytraining.entity.FreeLancerProfileEntity;

public interface IFLProfileDAO {
	public void insertFlProfDet(FreeLancerProfileEntity entity);
	public FreeLancerProfileEntity getFLProfileDet(Long userId);
	public void updateFlProfDet(FreeLancerProfileEntity entity);
}
