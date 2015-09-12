package com.searchmytraining.dao;

import com.searchmytraining.entity.GroupRequestEntity;
import com.searchmytraining.entity.StudentEntity;

public interface GroupTrainingRequestDao {
	public int retrieveStudentCount();
	public void saveStudent(StudentEntity entity);
	public void saveGroupRequest(GroupRequestEntity entity);
}
