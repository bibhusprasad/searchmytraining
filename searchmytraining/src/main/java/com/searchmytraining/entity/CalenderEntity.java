package com.searchmytraining.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name = "tbl_trngcalender")
public class CalenderEntity implements Serializable {
	private static final long serialVersionUID = 15456654646L;

	@Id
	@GeneratedValue
	@Column(name = "calenderId")
	private Integer calenderId;
	
	@Column(name = "courseTitle")
	private String courseTitle;

	@Column(name = "calenderType")
	private String calenderType;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = IndustryEntity.class)
	@JoinColumn(name = "industryId")
	private IndustryEntity industryId;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "saveDraft")
	private boolean saveDraft;
	
	@Column(name = "showPrice")
	private boolean showPrice;
	
	@Column(name = "fromDate")
	private Date fromDate;

	@Column(name = "toDate")
	private Date toDate;
	
	@Column(name = "time")
	private String time;

	//section 2
	@Column(name = "addressLine1")
	private String addressLine1;
	
	@Column(name = "addressLine2")
	private String addressLine2;
	
	@Column(name = "landmark")
	private String landmark;
	
	
	@JoinColumn(name="cityName")  
	private String cityName;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="stateId")
	private StateEntity stateId;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="countryId")
	private CountryEntity countryId;
	
	@Column(name = "pincode")
	private int pincode;
	
	//start of section 3
	@Column(name = "trngQuickView")
	private String trngQuickView;
	
	@Column(name = "trngOverView")
	private String trngOverView;
	
	@Column(name = "trngTakeAway")
	private String trngTakeAway;
	
	@Column(name = "trngMethodology")
	private String trngMethodology;
	
	@Column(name = "trngAttandant")
	private String trngAttandant;
	
	@Column(name = "trainingKey")
	private String trainingKey;

	//section 4
	@Column(name = "facultyDetails")
	private String facultyDetails;
	
	@Column(name = "howtoregister")
	private String howtoregister;
	
	@Column(name = "detailsOfProvider")
	private String detailsOfProvider;
	
	@Lob
	@Column(name = "brochure")
	private byte[] brochure;

	@Column(name = "createdOn")
	private Date createdOn;

	@Column(name = "createdBy")
	private Long createdBy;

	@Column(name = "updatedOn")
	private Date updatedOn;

	@Column(name = "updatedBy")
	private Long updatedBy;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = UserEntity.class)
	@JoinColumn(name = "userId")
	private UserEntity userId;

	public Integer getCalenderId() {
		return calenderId;
	}

	public void setCalenderId(Integer calenderId) {
		this.calenderId = calenderId;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCalenderType() {
		return calenderType;
	}

	public void setCalenderType(String calenderType) {
		this.calenderType = calenderType;
	}

	public IndustryEntity getIndustryId() {
		return industryId;
	}

	public void setIndustryId(IndustryEntity industryId) {
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

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
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

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public StateEntity getStateId() {
		return stateId;
	}

	public void setStateId(StateEntity stateId) {
		this.stateId = stateId;
	}

	public CountryEntity getCountryId() {
		return countryId;
	}

	public void setCountryId(CountryEntity countryId) {
		this.countryId = countryId;
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

	public byte[] getBrochure() {
		return brochure;
	}

	public void setBrochure(byte[] brochure) {
		this.brochure = brochure;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public Long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Long long1) {
		this.createdBy = long1;
	}

	public Long getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Long long1) {
		this.updatedBy = long1;
	}
	
}
