package com.searchmytraining.dto;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class TrainerInstituteOverviewDTO {

	@NotEmpty(message="Please enter valid faculty details")
	@Size(min=10, max=1000,message="faculty Details length Must be between {min} to {max}")
	private String facultyDetails;
	
	@NotEmpty(message="Please enter a valid description")
	@Size(min=10, max=2000,message="Registration Details length Must be between {min} to {max}")
	private String howtoregister;
	
	@NotEmpty(message="Please enter a valid Training Provider")
	@Size(min=10, max=1000,message="Training Provider details Must be between {min} to {max}")
	private String detailsOfProvider;
	
	private byte[] calenderPdf;
	
	private String previewCalender;
	
	public String getPreviewCalender() {
		return previewCalender;
	}

	public void setPreviewCalender(String previewCalender) {
		this.previewCalender = previewCalender;
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
	
	public String getFacultyDetails() {
		return facultyDetails;
	}

	public void setFacultyDetails(String facultyDetails) {
		this.facultyDetails = facultyDetails;
	}
}
