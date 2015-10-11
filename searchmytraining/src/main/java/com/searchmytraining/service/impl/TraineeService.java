package com.searchmytraining.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.common.constant.SearchMyTrainingConstant;
import com.searchmytraining.dao.RoleDAO;
import com.searchmytraining.dao.StatusDAO;
import com.searchmytraining.dao.TraineeDAO;
import com.searchmytraining.dao.UserDAO;
import com.searchmytraining.dto.TraineeDTO;
import com.searchmytraining.entity.RoleEntity;
import com.searchmytraining.entity.StatusEntity;
import com.searchmytraining.entity.TraineeEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.exception.SearchMyTrainingException;
import com.searchmytraining.service.ITraineeService;
@Component
@Service
public class TraineeService implements ITraineeService {
	
	private final Logger log = Logger.getLogger(this.getClass().getName());

	@Autowired
	private StatusDAO statusDAO;
	@Autowired
	private TraineeDAO traineeDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private DozerBeanMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	@Transactional
	public Map<Integer,Boolean> registerTrainee(TraineeDTO traineedto) throws SearchMyTrainingException{
		TraineeEntity traineeentity = mapper.map(traineedto, TraineeEntity.class);
		log.debug(traineeentity);
		Map<Integer,Boolean> statusMap=new HashMap<Integer,Boolean>();
		UserEntity userEntity = null;
		RoleEntity roleEntity = null;
		//one is default for new registration
		userEntity = userDAO.getUser(traineedto.getEmail());
		if(null == userEntity){
			userEntity=new UserEntity();
			StatusEntity status = statusDAO.getStatus(SearchMyTrainingConstant.ONE);
			userEntity.setUserName(traineedto.getEmail());
			userEntity.setPassword(encoder.encode(traineedto.getPassword()));
			userEntity.setEnabled(Boolean.TRUE);
			userEntity.setAccountNonExpired(Boolean.TRUE);
			userEntity.setAccountNonLocked(Boolean.TRUE);
			userEntity.setCredentialsNonExpired(Boolean.TRUE);
			userEntity.setStatus(status);
			//persist method not required
			userDAO.addUser(userEntity);
			roleEntity=new RoleEntity();
			roleEntity.setROLE(SearchMyTrainingConstant.TRAINEE);
			roleEntity.setUser(userEntity);
			roleDAO.setRoleToUser(roleEntity);
			traineeentity.setUser(userEntity);
			traineeDAO.registerTrainee(traineeentity);
			statusMap.put(userEntity.getUserId(), true);
		}else{
			statusMap.put(userEntity.getUserId(), false);	
		}
		return statusMap;
	}

	@Override
	public TraineeEntity getTrainee(Integer userid) {
		return traineeDAO.getTrainee(userid);
	}

}
