package com.searchmytraining.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.searchmytraining.common.constant.CalenderType;

public class TrainingProviderCalenderDTO {
	
	@NotNull(message="Please enter Course Title")
	@Size(min=2, max=50,message="Course Title Must be between {min} to {max}")
	private String courseTitle;
	
	@NotNull(message="Please enter calender Type")
	private CalenderType calenderType;
	
	private int industryId;
	
	private Double price;
	
	private boolean saveDraft;
	
	private boolean showPrice;
	
	private boolean isEdit;
	
	@NotNull(message="Please enter a valid date")     
	private String fromDate;
	
	@NotNull(message="Please enter a valid date")     
	private String toDate;

	@NotNull(message="Please enter a valid time") 
	@Size(min=5, max=50,message="Time Length Must be between {min} to {max}")
	private String time;
	
	@Size(min=0, max=1000,message="Quick View length Must be between {min} to {max}")
	private String addressLine1;
	
	@Size(min=0, max=1000,message="Quick View length Must be between {min} to {max}")
	private String addressLine2;
	
	private String landmark;
	
	@NotNull(message="Please enter a valid city")     
	private String city;
	
	@NotNull(message="Please enter a valid state")     
	private int state;
	
	@NotNull(message="Please enter a valid country")     
	private String country;
	
	private int pincode;
	
	@NotEmpty(message="Please enter a valid Quick View")
	@Size(min=10, max=250,message="Quick View length Must be between {min} to {max}")
	private String trngQuickView;
	
	@NotEmpty(message="Please enter a valid Training Overview")
	@Size(min=0, max=2000,message="Training Overview length Must be between {min} to {max}")
	private String trngOverView;
	
	@Size(min=0, max=250,message="Description For training Must be between {min} to {max}")
	private String trngTakeAway;
	
	@Size(min=0, max=250,message="training Methodology Must be between {min} to {max}")
	private String trngMethodology;
	
	@Size(min=0, max=250,message="training Attandant Must be between {min} to {max}")
	private String trngAttandant;
	
	@NotEmpty(message="Please enter a valid Training Key")
	@Size(min=1, max=200,message="valid Training Keylength must be between {min} to {max}")
	private String trainingKey;
	
	@Size(min=0, max=500,message="faculty Details length Must be between {min} to {max}")
	private String facultyDetails;
	
	@Size(min=0, max=250,message="Registration Details length Must be between {min} to {max}")
	private String howtoregister;
	
	@Size(min=0, max=500,message="Training Provider details Must be between {min} to {max}")
	private String detailsOfProvider;
	
	private CommonsMultipartFile multipartfile;

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public CalenderType getCalenderType() {
		return calenderType;
	}

	public void setCalenderType(CalenderType calenderType) {
		this.calenderType = calenderType;
	}

	public int getIndustryId() {
		return industryId;
	}

	public void setIndustryId(int industryId) {
		this.industryId = industryId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public boolean isSaveDraft() {
		return saveDraft;
	}

	public void setSaveDraft(boolean saveDraft) {
		this.saveDraft = saveDraft;
	}

	public boolean isShowPrice() {
		return showPrice;
	}

	public void setShowPrice(boolean showPrice) {
		this.showPrice = showPrice;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getTrngQuickView() {
		return trngQuickView;
	}

	public void setTrngQuickView(String trngQuickView) {
		this.trngQuickView = trngQuickView;
	}

	public String getTrngOverView() {
		return trngOverView;
	}

	public void setTrngOverView(String trngOverView) {
		this.trngOverView = trngOverView;
	}

	public String getTrngTakeAway() {
		return trngTakeAway;
	}

	public void setTrngTakeAway(String trngTakeAway) {
		this.trngTakeAway = trngTakeAway;
	}

	public String getTrngMethodology() {
		return trngMethodology;
	}

	public void setTrngMethodology(String trngMethodology) {
		this.trngMethodology = trngMethodology;
	}

	public String getTrngAttandant() {
		return trngAttandant;
	}

	public void setTrngAttandant(String trngAttandant) {
		this.trngAttandant = trngAttandant;
	}

	public String getTrainingKey() {
		return trainingKey;
	}

	public void setTrainingKey(String trainingKey) {
		this.trainingKey = trainingKey;
	}

	public String getFacultyDetails() {
		return facultyDetails;
	}

	public void setFacultyDetails(String facultyDetails) {
		this.facultyDetails = facultyDetails;
	}

	public String getHowtoregister() {
		return howtoregister;
	}

	public void setHowtoregister(String howtoregister) {
		this.howtoregister = howtoregister;
	}

	public String getDetailsOfProvider() {
		return detailsOfProvider;
	}

	public void setDetailsOfProvider(String detailsOfProvider) {
		this.detailsOfProvider = detailsOfProvider;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public CommonsMultipartFile getMultipartfile() {
		return multipartfile;
	}

	public void setMultipartfile(CommonsMultipartFile multipartfile) {
		this.multipartfile = multipartfile;
	}

	public boolean isEdit() {
		return isEdit;
	}

	public void setEdit(boolean isEdit) {
		this.isEdit = isEdit;
	}
}