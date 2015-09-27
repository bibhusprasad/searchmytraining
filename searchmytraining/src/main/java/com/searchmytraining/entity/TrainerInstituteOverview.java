package com.searchmytraining.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
@Table(name = "tbl_trnginstituteoverview")
public class TrainerInstituteOverview implements Serializable{
	
	private static final long serialVersionUID = 4888909014839246031L;

	@Id
	@GeneratedValue
	@Column(name = "trngoverviewId")
	private Integer trngoverviewId;
	
	@Column(name = "facultyDetails")
	private String facultyDetails;
	
	@Column(name = "howtoregister")
	private String howtoregister;
	
	@Column(name = "detailsOfProvider")
	private String detailsOfProvider;
	
	@Lob
	@Column(name = "calenderPdf")
	private byte[] calenderPdf;

	public Integer getTrngoverviewId() {
		return trngoverviewId;
	}

	public void setTrngoverviewId(Integer trngoverviewId) {
		this.trngoverviewId = trngoverviewId;
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

	public byte[] getCalenderPdf() {
		return calenderPdf;
	}

	public void setCalenderPdf(byte[] calenderPdf) {
		this.calenderPdf = calenderPdf;
	}

}
