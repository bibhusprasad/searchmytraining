package com.searchmytraining.service.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.controller.SMTException;
import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.CalenderDetailsDTO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.IndustryEntity;
import com.searchmytraining.entity.UserEntity;
import com.searchmytraining.service.ICalenderService;
import com.searchmytraining.service.ICityService;
import com.searchmytraining.service.ICountryService;
import com.searchmytraining.service.IIndustrySerivice;
import com.searchmytraining.service.IStateService;

@Service
public class CalenderService implements ICalenderService {
	@Autowired
	private CalenderDAO calenderDAO;

	@Autowired
	private IIndustrySerivice iIndustrySerivice;

	@Autowired
	private ICityService iCityService;

	@Autowired
	private IStateService iStateService;

	@Autowired
	private ICountryService iCountryService;

	@Override
	@Transactional
	public void addCalender(CalenderEntity entity) {
		calenderDAO.addCalender(entity);
	}

	@Override
	public List<CalenderEntity> getRecentelyAdded(Integer userId,
			Timestamp timestamp) {
		return calenderDAO.getRecentelyAdded(userId, timestamp);
	}

	@Override
	public List<CalenderEntity> getUserCalender(Integer userId) {
		return calenderDAO.getUserCalender(userId);
	}

	@Override
	public List<CalenderEntity> getAllCalender() {
		return calenderDAO.getAllCalender();
	}

	@Override
	public String updateCalender(CalenderEntity entity) {
		return calenderDAO.updateCalender(entity);
	}

	@Override
	public void removeCalender(Integer calenderId,long userId) {
		List<CalenderEntity> calenderEntities=calenderDAO.getCalenderDetailByCalId(userId,calenderId);
		if(null != calenderEntities && calenderEntities.size()>0){
			calenderDAO.deleteCalenderDetailByCalId(userId, calenderId);
		}
	}

	@Override
	public List<CalenderEntity> getCalendersByKeyword(String kyeword)
			throws Exception {
		return calenderDAO.getCalendersByKeyword(kyeword);
	}

	@Override
	public List<CalenderEntity> getCalendersOnSearch(
			SearchCalendarDTO searchcaldto) {
		return calenderDAO.getCalendersOnSearch(searchcaldto);
	}

	public Timestamp convertStringToTimestamp(String datesString) {
	    try {
	      DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
	      Date date = (Date) formatter.parse(datesString);
	      java.sql.Timestamp timeStampDate = new Timestamp(date.getTime());
	      return timeStampDate;
	    } catch (ParseException e) {
	      return null;
	    }
	}
	@Override
	public List<CalenderEntity> getUserCalenderDetails(Long userId,CalenderDetailsDTO calenderDetailsDTO ) {
		return calenderDAO.getUserCalender(userId,calenderDetailsDTO);
	}
	

	@Override
	public void savePostCalenser(TrainingProviderCalenderDTO tpcalDTO, UserEntity user)
			throws SMTException {
		CalenderEntity calenderEntity = new CalenderEntity();

		calenderEntity.setCourseTitle(tpcalDTO.getCourseTitle());
		calenderEntity.setCalenderType(String.valueOf(tpcalDTO.getCalenderType()));
		calenderEntity.setPrice(tpcalDTO.getPrice());
		calenderEntity.setFromDate(convertStringToTimestamp(tpcalDTO.getFromDate()));
		calenderEntity.setToDate(convertStringToTimestamp(tpcalDTO.getToDate()));
		calenderEntity.setTime(tpcalDTO.getTime());
		// create industry sub category
		IndustryEntity industryEntity = iIndustrySerivice
				.getIndustryById((Integer)tpcalDTO.getIndustryId());
		calenderEntity.setIndustryId(industryEntity);

		calenderEntity.setAddressLine1(tpcalDTO.getAddressLine1());
		calenderEntity.setAddressLine2(tpcalDTO.getAddressLine2());
		calenderEntity.setLandmark(tpcalDTO.getLandmark());
		calenderEntity.setCityName(tpcalDTO.getCity());
		calenderEntity.setStateId(iStateService.getStateEntityById((Integer)tpcalDTO
				.getState()));
		calenderEntity.setCountryId(iCountryService.getCountry(tpcalDTO
				.getCountry()));
		calenderEntity.setPincode(tpcalDTO.getPincode());

		calenderEntity.setTrngQuickView(tpcalDTO.getTrngQuickView());
		calenderEntity.setTrngOverView(tpcalDTO.getTrngOverView());
		calenderEntity.setTrngTakeAway(tpcalDTO.getTrngTakeAway());
		calenderEntity.setTrngMethodology(tpcalDTO.getTrngMethodology());
		calenderEntity.setTrngAttandant(tpcalDTO.getTrngAttandant());
		calenderEntity.setTrainingKey(tpcalDTO.getTrainingKey());
		calenderEntity.setCreatedBy(user.getUserId());
		calenderEntity.setUpdatedBy(user.getUserId());
		calenderEntity.setCreatedOn(new Date());
		calenderEntity.setUpdatedOn(new Date());
		calenderEntity.setFacultyDetails(tpcalDTO.getFacultyDetails());
		calenderEntity.setHowtoregister(tpcalDTO.getHowtoregister());
		calenderEntity.setDetailsOfProvider(tpcalDTO.getDetailsOfProvider());
		calenderEntity.setUserId(user);
		calenderDAO.addCalender(calenderEntity);
	}

	@Override
	public List<CalenderEntity> getCalenderDetailByCalId(Long userId,
			Integer calId) {
		return calenderDAO.getCalenderDetailByCalId(userId,calId);
	}

}
