package com.searchmytraining.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.searchmytraining.entity.CityEntity;
import com.searchmytraining.entity.CountryEntity;
import com.searchmytraining.entity.StateEntity;

public class InstituteAddressDTO {
	
	@NotEmpty(message="Please enter a valid address")
	@Size(min=5, max=500,message="Name length Must be between {min} to {max}")
	private String addressLine1;
	
	private String addressLine2;
	
	@NotEmpty(message="Please enter a valid landmark")
	@Size(min=10, max=200,message="Name length Must be between {min} to {max}")
	private String landmark;
	
	private CityEntity city;
	
	private StateEntity state;
	
	private CountryEntity country;
	
	@Size(min=6, max=6,message="Please enter a valid pincode")
	private int pincode;

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
}
