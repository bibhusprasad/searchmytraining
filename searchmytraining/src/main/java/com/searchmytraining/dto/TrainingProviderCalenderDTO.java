package com.searchmytraining.dto;

import java.sql.Timestamp;
import java.util.Date;

import javax.validation.Valid;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.searchmytraining.entity.IndustrySubCategoryEntity;
import com.searchmytraining.entity.UserEntity;

public class TrainingProviderCalenderDTO {
	
	private String code;

	@NotNull(message="Please enter a valid title")     
	private String title;

	@NotNull(message="Please enter a valid date")     
	@Future (message="Only the Future is valid")     
	private Date startDate;

	@NotNull(message="Please enter a valid date")     
	@Future (message="Only the Future is valid")     
	private Date endDate;

	@NotNull(message="Please enter price")     
	private Double price;

	private String brochure;

	private String type;

	private String status;

	private Timestamp createdOn;

	private String createdBy;

	private Timestamp updatedOn;

	private String updatedBy;

	@NotEmpty(message="Please enter valid description")
	private String description;

	private String contenttype;

	private Integer rank;

	private String vFlag;

	@NotEmpty(message="Please enter valid Keyword")
	private String keyword;

	private UserEntity user;

	private IndustrySubCategoryEntity indstrySubcat;
	
	@Valid
	private InstituteAddressDTO instituteAddressDTO;

	@Valid
	private TrainingOverviewDTO trainingOverviewDTO;

	@Valid
	private TrainerInstituteOverviewDTO trainerInstituteOverviewDTO;
	
	private boolean savedraft;
	
	private boolean showprice;
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getBrochure() {
		return brochure;
	}

	public void setBrochure(String brochure) {
		this.brochure = brochure;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContenttype() {
		return contenttype;
	}

	public void setContenttype(String contenttype) {
		this.contenttype = contenttype;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getvFlag() {
		return vFlag;
	}

	public void setvFlag(String vFlag) {
		this.vFlag = vFlag;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public IndustrySubCategoryEntity getIndstrySubcat() {
		return indstrySubcat;
	}

	public void setIndstrySubcat(IndustrySubCategoryEntity indstrySubcat) {
		this.indstrySubcat = indstrySubcat;
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
