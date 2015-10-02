package com.searchmytraining.dto;

import java.util.Date;

import javax.validation.Valid;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class TrainingProviderCalenderDTO {
	
	@NotNull(message="Please enter a valid title")     
	private String title;

	private String calenderType;
	
	private String industryType;
	
	@NotNull(message="Please enter price")     
	private Double price;

	@NotNull(message="Please enter a valid date")     
	@Future (message="Only the Future is valid")     
	private Date startDate;

	@NotNull(message="Please enter a valid date")     
	@Future (message="Only the Future is valid")     
	private Date endDate;

	private String time;
	
	private MultipartFile brochure;

	@Valid
	private InstituteAddressDTO instituteAddressDTO;

	@Valid
	private TrainingOverviewDTO trainingOverviewDTO;

	@Valid
	private TrainerInstituteOverviewDTO trainerInstituteOverviewDTO;
	
	private boolean savedraft;
	
	private boolean showprice;
	
	public String getCalenderType() {
		return calenderType;
	}

	public void setCalenderType(String calenderType) {
		this.calenderType = calenderType;
	}

	public String getIndustryType() {
		return industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public MultipartFile getBrochure() {
		return brochure;
	}

	public void setBrochure(MultipartFile brochure) {
		this.brochure = brochure;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}


	public InstituteAddressDTO getInstituteAddressDTO() {
		return instituteAddressDTO;
	}

	public void setInstituteAddressDTO(InstituteAddressDTO instituteAddressDTO) {
		this.instituteAddressDTO = instituteAddressDTO;
	}

	public TrainingOverviewDTO getTrainingOverviewDTO() {
		return trainingOverviewDTO;
	}

	public void setTrainingOverviewDTO(TrainingOverviewDTO trainingOverviewDTO) {
		this.trainingOverviewDTO = trainingOverviewDTO;
	}

	public TrainerInstituteOverviewDTO getTrainerInstituteOverviewDTO() {
		return trainerInstituteOverviewDTO;
	}

	public void setTrainerInstituteOverviewDTO(
			TrainerInstituteOverviewDTO trainerInstituteOverviewDTO) {
		this.trainerInstituteOverviewDTO = trainerInstituteOverviewDTO;
	}

	public boolean isSavedraft() {
		return savedraft;
	}

	public void setSavedraft(boolean savedraft) {
		this.savedraft = savedraft;
	}

	public boolean isShowprice() {
		return showprice;
	}

	public void setShowprice(boolean showprice) {
		this.showprice = showprice;
	}
}
