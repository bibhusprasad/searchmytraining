package com.searchmytraining.service;

import java.sql.Timestamp;
import java.util.List;

import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;

public interface ICalenderService 
{
	public void addCalender(CalenderEntity entity);
	public List<CalenderEntity> getRecentelyAdded(Integer userId,Timestamp timestamp);
	public List<CalenderEntity> getUserCalender(Integer userId);
	public List<CalenderEntity> getAllCalender();
	public String updateCalender(CalenderEntity entity);
	public void removeCalender(long calenderId);
	public List<CalenderEntity> getCalendersByKeyword(String kyeword) throws Exception;
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto);
	
}
