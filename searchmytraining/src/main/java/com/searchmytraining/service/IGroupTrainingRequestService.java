package com.searchmytraining.service;

import com.searchmytraining.dto.StudentDTO;
import com.searchmytraining.entity.GroupRequestEntity;

public interface IGroupTrainingRequestService {

	public int retrieveStudentCount() ;
	public void saveStudent(StudentDTO dto);
	public void saveGroupRequest(GroupRequestEntity entity);
}
