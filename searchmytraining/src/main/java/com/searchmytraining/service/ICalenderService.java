package com.searchmytraining.service;

import java.sql.Timestamp;
import java.util.List;

import com.searchmytraining.controller.SMTException;
import com.searchmytraining.dto.CalenderDetailsDTO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.UserEntity;

public interface ICalenderService 
{
	public void addCalender(CalenderEntity entity);
	public List<CalenderEntity> getRecentelyAdded(Integer userId,Timestamp timestamp);
	public List<CalenderEntity> getUserCalender(Integer userId);
	public List<CalenderEntity> getAllCalender();
	public String updateCalender(CalenderEntity entity);
	public List<CalenderEntity> getCalendersByKeyword(String kyeword) throws Exception;
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto);
	public void savePostCalenser(TrainingProviderCalenderDTO trainingProviderCalenderDTO, UserEntity user) throws SMTException;
	List<CalenderEntity> getUserCalenderDetails(Long userId,CalenderDetailsDTO calenderDetailsDTO);
	CalenderEntity getCalenderDetailByCalId(Long userId, Integer calId);
	void removeCalender(CalenderEntity calentity);
	public void updateCalender(TrainingProviderCalenderDTO trainingProviderCalenderDTO, UserEntity user);
	
}
