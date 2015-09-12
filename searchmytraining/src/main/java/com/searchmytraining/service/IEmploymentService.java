package com.searchmytraining.service;

import com.searchmytraining.dto.EmploymentDTO;
import com.searchmytraining.entity.EmploymentEntity;

public interface IEmploymentService {

	public void updateEmpldet(EmploymentDTO empldto);
	public EmploymentEntity findEmplDet(Integer userid);
}
