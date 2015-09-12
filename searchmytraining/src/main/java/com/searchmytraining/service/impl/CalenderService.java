package com.searchmytraining.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.service.ICalenderService;

@Service
public class CalenderService implements ICalenderService 
{
	@Autowired
	CalenderDAO daoObj;
	
	@Override
	@Transactional
	public void addCalender(CalenderEntity entity) 
	{
		daoObj.addCalender(entity);
	}

	@Override
	public List<CalenderEntity> getRecentelyAdded(Integer userId,
			Timestamp timestamp) {
		return daoObj.getRecentelyAdded(userId, timestamp);
	}

	@Override
	public List<CalenderEntity> getUserCalender(Integer userId) {
		return daoObj.getUserCalender(userId);
	}

	@Override
	public List<CalenderEntity> getAllCalender() {
		return daoObj.getAllCalender();
	}

	@Override
	public String updateCalender(CalenderEntity entity) {
		// TODO Auto-generated method stub
		return daoObj.updateCalender(entity);
	}

	@Override
	public void removeCalender(long calenderId) {
		daoObj.removeCalender(calenderId);
		
	}

	@Override
	public List<CalenderEntity> getCalendersByKeyword(String kyeword) throws Exception{
		return daoObj.getCalendersByKeyword(kyeword);
	}

	@Override
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto) {
		return daoObj.getCalendersOnSearch(searchcaldto);
	}

}
