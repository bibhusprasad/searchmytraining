package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="tbl_statemaster")
public class StateEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="stateId")
	private Long stateId;
	
	@Column(name="stateName")
	private String stateName;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="countryId")
	private CountryEntity country;

	public Long getStateId() {
		return stateId;
	}

	public void setStateId(Long stateId) {
		this.stateId = stateId;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public CountryEntity getCountry() {
		return country;
	}



	public void setCountry(CountryEntity country) {
		this.country = country;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
}
