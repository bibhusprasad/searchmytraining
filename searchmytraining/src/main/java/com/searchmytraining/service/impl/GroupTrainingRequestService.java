package com.searchmytraining.service.impl;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.GroupTrainingRequestDao;
import com.searchmytraining.dto.StudentDTO;
import com.searchmytraining.entity.GroupRequestEntity;
import com.searchmytraining.entity.StudentEntity;
import com.searchmytraining.service.IGroupTrainingRequestService;

@Service
public class GroupTrainingRequestService implements
		IGroupTrainingRequestService {

	@Autowired
	private GroupTrainingRequestDao groupTrainingDao;
	@Autowired
	private DozerBeanMapper mapper;

	public int retrieveStudentCount() {

		return groupTrainingDao.retrieveStudentCount();
	}

	@Transactional
	public void saveStudent(StudentDTO dto) {
		StudentEntity entity = mapper.map(dto, StudentEntity.class);
		System.out.println(entity.getName()+":"+entity.getAge()+":"+entity.getId());
		
		/*groupTrainingDao.saveStudent(entity);*/
	}

	@Transactional
	public void saveGroupRequest(GroupRequestEntity entity) {
		groupTrainingDao.saveGroupRequest(entity);
	}

}
