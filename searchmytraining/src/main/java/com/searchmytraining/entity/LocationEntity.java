package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_locainfodetails")
public class LocationEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="locDetialsId")
	private Integer locDetialsId;
	@Column(name="buildingNo")
	private String buildingNo;
	@Column(name="street")
	private String street;
	@Column(name="landmark")
	private String landmark;
	@Column(name="pincode")
	private Integer pincode;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=CityEntity.class)
	@JoinColumn(name="cityId")
	private CityEntity city;
	
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=UserEntity.class)
	@JoinColumn(name="userId")
	private UserEntity user;

	public Integer getLocDetialsId() {
		return locDetialsId;
	}
	public void setLocDetialsId(Integer locDetialsId) {
		this.locDetialsId = locDetialsId;
	}
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public Integer getPincode() {
		return pincode;
	}
	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}
	public CityEntity getCity() {
		return city;
	}
	public void setCity(CityEntity city) {
		this.city = city;
	}
	public UserEntity getUser() {
		return user;
	}
	public void setUser(UserEntity user) {
		this.user = user;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "LocationEntity [locDetialsId=" + locDetialsId + ", buildingNo="
				+ buildingNo + ", street=" + street + ", landmark=" + landmark
				+ ", pincode=" + pincode + ", city=" + city + ", user=" + user
				+ "]";
	}
}
