package com.searchmytraining.entity;

import java.io.Serializable;
import java.sql.Timestamp;

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

import com.searchmytraining.common.constant.CalenderType;

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
	
	@Column(name = "title")
	private String courseTitle;

	@Column(name = "calType")
	private CalenderType calenderType;

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
	private Timestamp fromDate;

	@Column(name = "toDate")
	private Timestamp toDate;
	
	@Column(name = "time")
	private String time;

	//section 2
	@Column(name = "addressLine1")
	private String addressLine1;
	
	@Column(name = "addressLine2")
	private String addressLine2;
	
	@Column(name = "landmark")
	private String landmark;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="cityId")
	private CityEntity city;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="stateId")
	private StateEntity state;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="countryId")
	private CountryEntity country;
	
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

	//table  log
	@Column(name = "createdOn")
	private Timestamp createdOn;

	@Column(name = "createdBy")
	private UserEntity createdBy;

	@Column(name = "updatedOn")
	private Timestamp updatedOn;

	@Column(name = "updatedBy")
	private UserEntity updatedBy;

	@ManyToOne(fetch = FetchType.EAGER, targetEntity = UserEntity.class)
	@JoinColumn(name = "trnProId")
	private UserEntity user;

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

	public CalenderType getCalenderType() {
		return calenderType;
	}

	public void setCalenderType(CalenderType calenderType) {
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

	

	public Timestamp getFromDate() {
		return fromDate;
	}

	public void setFromDate(Timestamp fromDate) {
		this.fromDate = fromDate;
	}

	public Timestamp getToDate() {
		return toDate;
	}

	public void setToDate(Timestamp toDate) {
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

	public CityEntity getCity() {
		return city;
	}

	public void setCity(CityEntity city) {
		this.city = city;
	}

	public StateEntity getState() {
		return state;
	}

	public void setState(StateEntity state) {
		this.state = state;
	}

	public CountryEntity getCountry() {
		return country;
	}

	public void setCountry(CountryEntity country) {
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

	public byte[] getBrochure() {
		return brochure;
	}

	public void setBrochure(byte[] brochure) {
		this.brochure = brochure;
	}

	public Timestamp getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}
	
	public Timestamp getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Timestamp updatedOn) {
		this.updatedOn = updatedOn;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public UserEntity getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(UserEntity createdBy) {
		this.createdBy = createdBy;
	}

	public UserEntity getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(UserEntity updatedBy) {
		this.updatedBy = updatedBy;
	}
	
}
