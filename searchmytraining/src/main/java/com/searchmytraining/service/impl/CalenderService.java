package com.searchmytraining.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.controller.SMTException;
import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.IndustryEntity;
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
		// TODO Auto-generated method stub
		return calenderDAO.updateCalender(entity);
	}

	@Override
	public void removeCalender(long calenderId) {
		calenderDAO.removeCalender(calenderId);

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

	@Override
	public void savePostCalenser(TrainingProviderCalenderDTO tpcalDTO)
			throws SMTException {
		CalenderEntity calenderEntity = new CalenderEntity();

		calenderEntity.setCourseTitle(tpcalDTO.getCourseTitle());
		calenderEntity.setCalenderType(tpcalDTO.getCalenderType());
		calenderEntity.setPrice(tpcalDTO.getPrice());
		calenderEntity.setFromDate(tpcalDTO.getFromDate());
		calenderEntity.setToDate(tpcalDTO.getToDate());
		calenderEntity.setTime(tpcalDTO.getTime());

		// create industry sub category
		IndustryEntity industryEntity = iIndustrySerivice
				.getIndustryById(tpcalDTO.getIndustryId());
		calenderEntity.setIndustryId(industryEntity);

		calenderEntity.setAddressLine1(tpcalDTO.getAddressLine1());
		calenderEntity.setAddressLine2(tpcalDTO.getAddressLine2());
		calenderEntity.setLandmark(tpcalDTO.getLandmark());
		calenderEntity.setCity(iCityService.getCity(tpcalDTO.getCity()));
		calenderEntity.setState(iStateService.getStateEntityById(tpcalDTO
				.getState()));
		calenderEntity.setCountry(iCountryService.getCountry((long) tpcalDTO
				.getCountry()));
		calenderEntity.setPincode(tpcalDTO.getPincode());

		calenderEntity.setTrngQuickView(tpcalDTO.getTrngQuickView());
		calenderEntity.setTrngOverView(tpcalDTO.getTrngOverView());
		calenderEntity.setTrngTakeAway(tpcalDTO.getTrngTakeAway());
		calenderEntity.setTrngMethodology(tpcalDTO.getTrngMethodology());
		calenderEntity.setTrngAttandant(tpcalDTO.getTrngAttandant());
		calenderEntity.setTrainingKey(tpcalDTO.getTrainingKey());

		calenderEntity.setFacultyDetails(tpcalDTO.getFacultyDetails());
		calenderEntity.setHowtoregister(tpcalDTO.getHowtoregister());
		calenderEntity.setDetailsOfProvider(tpcalDTO.getDetailsOfProvider());
		calenderDAO.addCalender(calenderEntity);
	}

}
