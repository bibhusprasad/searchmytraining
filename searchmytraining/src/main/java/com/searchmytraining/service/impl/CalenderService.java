package com.searchmytraining.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.searchmytraining.dao.CalenderDAO;
import com.searchmytraining.dto.SearchCalendarDTO;
import com.searchmytraining.dto.TrainingProviderCalenderDTO;
import com.searchmytraining.entity.CalenderEntity;
import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.InstituteAddressEntity;
import com.searchmytraining.entity.TrainerInstituteOverviewEntity;
import com.searchmytraining.entity.TrainingOverviewEntity;
import com.searchmytraining.service.ICalenderService;

@Service
public class CalenderService implements ICalenderService {
	@Autowired
	CalenderDAO calenderDAO;

	@Override
	@Transactional
	public void addCalender(CalenderEntity entity) {
		calenderDAO.addCalender(entity);
	}

	@Override
	public List<CalenderEntity> getRecentelyAdded(Integer userId, Timestamp timestamp) {
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
	public List<CalenderEntity> getCalendersByKeyword(String kyeword) throws Exception {
		return calenderDAO.getCalendersByKeyword(kyeword);
	}

	@Override
	public List<CalenderEntity> getCalendersOnSearch(SearchCalendarDTO searchcaldto) {
		return calenderDAO.getCalendersOnSearch(searchcaldto);
	}

	@Override
	public void savePostCalenser(TrainingProviderCalenderDTO tpcalDTO) {
		CalenderEntity calenderEntity = new CalenderEntity();

		calenderEntity.setTitle(tpcalDTO.getTitle());
		calenderEntity.setType(tpcalDTO.getCalenderType());
		calenderEntity.setPrice(tpcalDTO.getPrice());
		calenderEntity.setStartDate(tpcalDTO.getStartDate().toString());
		calenderEntity.setEndDate(tpcalDTO.getEndDate().toString());
		calenderEntity.setTime(tpcalDTO.getTime());

		// create industrysubcategory
		int trnIndstrSubCatId = Integer.parseInt(tpcalDTO.getIndustryType());
		IndustrySubCategoryEntity industrySubCat = new IndustrySubCategoryEntity();
		industrySubCat.setTrnIndstrSubCatId(trnIndstrSubCatId);
		calenderEntity.setIndstrySubcat(industrySubCat);

		// create InstituteAddress
		InstituteAddressEntity instituteAddress = new InstituteAddressEntity();
		instituteAddress.setAddressLine1(tpcalDTO.getInstituteAddressDTO().getAddressLine1());
		instituteAddress.setAddressLine2(tpcalDTO.getInstituteAddressDTO().getAddressLine2());
		instituteAddress.setLandmark(tpcalDTO.getInstituteAddressDTO().getLandmark());
		instituteAddress.setCity(tpcalDTO.getInstituteAddressDTO().getCity());
		instituteAddress.setState(tpcalDTO.getInstituteAddressDTO().getState());
		instituteAddress.setCountry(tpcalDTO.getInstituteAddressDTO().getCountry());
		instituteAddress.setPincode(tpcalDTO.getInstituteAddressDTO().getPincode());
		calenderEntity.setInstituteAddress(instituteAddress);

		// create traine overview
		TrainingOverviewEntity trainingOverviewDTO = new TrainingOverviewEntity();
		trainingOverviewDTO.setTrngQuickView(tpcalDTO.getTrainingOverviewDTO().getTrngQuickView());
		trainingOverviewDTO.setTrngOverView(tpcalDTO.getTrainingOverviewDTO().getTrngOverView());
		trainingOverviewDTO.setTrngTakeAway(tpcalDTO.getTrainingOverviewDTO().getTrngTakeAway());
		trainingOverviewDTO.setTrngMethodology(tpcalDTO.getTrainingOverviewDTO().getTrngMethodology());
		trainingOverviewDTO.setTrngAttandant(tpcalDTO.getTrainingOverviewDTO().getTrngAttandant());
		trainingOverviewDTO.setTrngKey(tpcalDTO.getTrainingOverviewDTO().getTrngKey());
		calenderEntity.setTrainingOverview(trainingOverviewDTO);

		TrainerInstituteOverviewEntity tiOverviewEntity = new TrainerInstituteOverviewEntity();
		tiOverviewEntity.setFacultyDetails(tpcalDTO.getTrainerInstituteOverviewDTO().getFacultyDetails());
		tiOverviewEntity.setHowtoregister(tpcalDTO.getTrainerInstituteOverviewDTO().getHowtoregister());
		tiOverviewEntity.setDetailsOfProvider(tpcalDTO.getTrainerInstituteOverviewDTO().getDetailsOfProvider());
		tiOverviewEntity.setCalenderPdf(tpcalDTO.getTrainerInstituteOverviewDTO().getCalenderPdf());
		calenderEntity.setTrainerInstituteOverview(tiOverviewEntity);
		calenderDAO.addCalender(calenderEntity);
	}

}
