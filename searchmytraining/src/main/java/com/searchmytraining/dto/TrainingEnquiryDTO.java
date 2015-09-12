package com.searchmytraining.dto;

public class TrainingEnquiryDTO {
	
	private String name;
	private String companyName;
	private String coursetitle;
	private Integer cityid;
	private String phone;
	private String email;
	private String trngneeds;
	private Integer noOfParticipents;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNoOfParticipents() {
		return noOfParticipents;
	}
	public void setNoOfParticipents(Integer noOfParticipents) {
		this.noOfParticipents = noOfParticipents;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCoursetitle() {
		return coursetitle;
	}
	public void setCoursetitle(String coursetitle) {
		this.coursetitle = coursetitle;
	}
	public Integer getCityid() {
		return cityid;
	}
	public void setCityid(Integer cityid) {
		this.cityid = cityid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTrngneeds() {
		return trngneeds;
	}
	public void setTrngneeds(String trngneeds) {
		this.trngneeds = trngneeds;
	}
}
