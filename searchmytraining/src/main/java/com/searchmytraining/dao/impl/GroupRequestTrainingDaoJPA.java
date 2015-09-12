package com.searchmytraining.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.searchmytraining.dao.AbstractJpaDAO;
import com.searchmytraining.dao.GroupTrainingRequestDao;
import com.searchmytraining.entity.GroupRequestEntity;
import com.searchmytraining.entity.StudentEntity;
@Repository
public class GroupRequestTrainingDaoJPA  extends AbstractJpaDAO<GroupRequestEntity> implements GroupTrainingRequestDao {

	public int retrieveStudentCount() {
		List<GroupRequestEntity> students= findAll();
		return students.size();
	} 
	public GroupRequestTrainingDaoJPA() {
		/*super.setClazz(GroupRequestEntity.class) ;*/
	}

	
	public void saveStudent(StudentEntity entity) {		
		//getSession().save(entity);
		/*create(entity);*/
	}
	
	public void saveGroupRequest(GroupRequestEntity entity) {		
		create(entity);
	}
}
