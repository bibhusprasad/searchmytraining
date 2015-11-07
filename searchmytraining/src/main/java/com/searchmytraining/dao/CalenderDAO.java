package com.searchmytraining.dao;

import java.sql.Timestamp;
import java.util.List;

import com.searchmytraining.dto.CalenderDetailsDTO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;


public interface CalenderDAO 
{
	public void addCalender(CalenderEntity entity);
	public List<CalenderEntity> getRecentelyAdded(Integer userId,Timestamp timestamp);
	public List<CalenderEntity> getUserCalender(Integer userId);
	public List<CalenderEntity> getAllCalender();
	public String updateCalender(CalenderEntity entity);
	public void removeCalender(Integer calenderId);
	public List<CalenderEntity> getCalendersByKeyword(String kyeword) throws Exception;
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto);
	public List<CalenderEntity> getUserCalender(Long userId,
			CalenderDetailsDTO calenderDetailsDTO);
	public List<CalenderEntity> getCalenderDetailByCalId(Long userId,Integer calId);
	int deleteCalenderDetailByCalId(Long userId, Integer calId);
}
