package com.searchmytraining.dao;

import com.searchmytraining.entity.EmploymentEntity;

public interface IEmploymentDAO {
	
	public void updateEmpldet(EmploymentEntity emplEntity);
	public EmploymentEntity findEmplDet(Integer userid);

}
