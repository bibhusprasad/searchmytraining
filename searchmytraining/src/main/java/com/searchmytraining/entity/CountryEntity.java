package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_cntrymaster")
public class CountryEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="countryId")
	private Long countryId;
	
	@Column(name="countryName",nullable=false)
	private String countryName;

	public Long getCountryId() {
		return countryId;
	}

	public void setCountryId(Long countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
